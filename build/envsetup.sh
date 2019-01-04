function __print_extra_functions_help() {
cat <<EOF
Additional functions:
- mka:             Builds using SCHED_BATCH on all processors.
- pushboot:	   Push a file from your OUT dir to your phone
                   and reboots it, using absolute path.
- repopick:        Utility to fetch changes from Gerrit.
- aospremote:      Add git remote for matching AOSP repository.
- cafremote:       Add git remote for matching CodeAurora repository.
- gerrit:          add git remote for gerrit
EOF
}

# Make using all available CPUs
function mka() {
    case `uname -s` in
        Darwin)
            make -j `sysctl hw.ncpu|cut -d" " -f2` "$@"
            ;;
        *)
            schedtool -B -n 1 -e ionice -n 1 make -j `cat /proc/cpuinfo | grep "^processor" | wc -l` "$@"
            ;;
    esac
}

function breakfast()
{
    target=$1
    INVICTRIX_DEVICES_ONLY="true"
    unset LUNCH_MENU_CHOICES
    add_lunch_combo full-eng
    for f in `/bin/ls vendor/invictrix/vendorsetup.sh 2> /dev/null`
        do
            echo "including $f"
            . $f
        done
    unset f

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        echo "Nothing to eat for breakfast?"
        lunch
    else
        echo "z$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the model name
            lunch invictrix_$target-userdebug
        fi
    fi
    return $?
}

alias bib=breakfast

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        time mka bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function pushboot() {
    if [ ! -f $OUT/$* ]; then
        echo "File not found: $OUT/$*"
        return 1
    fi

    adb root
    sleep 1
    adb wait-for-device
    adb remount

    adb push $OUT/$* /$*
    adb reboot
}

function repopick() {
    set_stuff_for_environment
    T=$(gettop)
    $T/vendor/invictrix/build/tools/repopick.py $@
}

function aospremote() {
    git remote rm aosp 2> /dev/null
    if [ ! -d .git ]
    then
        echo .git directory not found. Please run this from the root directory of the Android repository you wish to set up.
    fi
    if [ ! "$ANDROID_BUILD_TOP" ]; then
        export ANDROID_BUILD_TOP=$(gettop)
    fi
    PROJECT=$(pwd -P | sed -e "s#$ANDROID_BUILD_TOP\/##; s#-caf.*##; s#\/default##")
    if (echo $PROJECT | grep -qv "^device")
    then
        PFX="platform/"
    fi
    git remote add aosp https://android.googlesource.com/$PFX$PROJECT
    echo "Remote 'aosp' created"
}
export -f aospremote

function cafremote()
{
    git remote rm caf 2> /dev/null
    if [ ! -d .git ]
    then
        echo .git directory not found. Please run this from the root directory of the Android repository you wish to set up.
    fi
    if [ ! "$ANDROID_BUILD_TOP" ]; then
        export ANDROID_BUILD_TOP=$(gettop)
    fi
    PROJECT=$(pwd -P | sed -e "s#$ANDROID_BUILD_TOP\/##; s#-caf.*##; s#\/default##")
    if (echo $PROJECT | grep -qv "^device")
    then
        PFX="platform/"
    fi
    git remote add caf https://source.codeaurora.org/quic/la/$PFX$PROJECT
    echo "Remote 'caf' created"
}
export -f cafremote

function gerrit()
{
    if [ ! -d ".git" ]; then
        echo -e "Please run this inside a git directory";
    else
        git remote rm gerrit 2>/dev/null;
        [[ -z "${GERRIT_USER}" ]] && export GERRIT_USER=$(git config --get review.review.aosiprom.com.username);
        if [[ -z "${GERRIT_USER}" ]]; then
            git remote add gerrit $(git remote -v | grep -i "github\.com\/InvictrixROM\/" | awk '{print $2}' | uniq | sed -e "s|https://github.com/InvictrixROM|ssh://review.invictrixrom.com:29418/|");
        else
            git remote add gerrit $(git remote -v | grep -i "github\.com\/InvictrixROM\/" | awk '{print $2}' | uniq | sed -e "s|https://github.com/InvictrixROM|ssh://${GERRIT_USER}@review.invictrixrom.com:29418/|");
        fi
    fi
}
export -f gerrit
