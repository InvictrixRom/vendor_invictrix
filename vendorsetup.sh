devices=('marlin')

function lunch_devices() {
    add_lunch_combo invictrix_${device}-user
    add_lunch_combo invictrix_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
