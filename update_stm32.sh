echo 228 > /sys/class/gpio/export
echo 142 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio228/direction
echo out > /sys/class/gpio/gpio142/direction
echo 1 > /sys/class/gpio/gpio228/value
echo 0 > /sys/class/gpio/gpio142/value
echo 1 > /sys/class/gpio/gpio142/value
sleep 0.5
chroot /server/tmp home/gem/TXv2-Pi-Project/flash_mainboard.sh
echo 0 > /sys/class/gpio/gpio228/value
echo 0 > /sys/class/gpio/gpio142/value
echo 1 > /sys/class/gpio/gpio142/value
echo 142 > /sys/class/gpio/unexport
echo 228 > /sys/class/gpio/unexport
