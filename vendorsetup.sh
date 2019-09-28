supported_devices=(
  'marlin'
  'fajita'
)

for device in ${supported_devices[@]}; do
    add_lunch_combo invictrix_${device}-user
    add_lunch_combo invictrix_${device}-userdebug
    add_lunch_combo invictrix_${device}-eng
done
