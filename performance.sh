#!/bin/bash
PS3='
Choose your power mode: '

# more info in https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt

echo 
echo Recommended "Conservative"
echo 

modes=("Performance" "Powersave" "Userspace" "Ondemand" "Conservative" "Schedutil" "Quit")
select mode in "${modes[@]}"; do
    case $mode in
        "Performance")
            echo "You selected $mode mode."
	    echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;
        "Powersave")
            echo "You selected $mode mode."
	    echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;
        "Userspace")
            echo "You selected $mode mode."
	    echo userspace | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;
        "Ondemand")
            echo "You selected $mode mode."
	    echo ondemand | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;
        "Conservative")
            echo "You selected $mode mode."
	    echo conservative | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;
	"Schedutil")
            echo "You selected $mode mode."
	    echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	    break
            ;;   
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
