supported_devices=(
  'marlin'
)

for device in ${supported_devices[@]}; do
    add_lunch_combo invictrix_${device}-user
    add_lunch_combo invictrix_${device}-userdebug
done
