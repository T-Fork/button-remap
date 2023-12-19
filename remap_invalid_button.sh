### code was snagged from this post https://stackoverflow.com/questions/74565068/mapping-device-input-event-codes-to-new-event-codes

#!/bin/bash
CONTROLLER1_LOCATION=/dev/input/by-id/usb-POLSIMER_Wheel_Leds_6384800-if04-event-joystick #change to controller in question
CONTROLLER1_EVENT_PORT=event4 # enter coresponding event-port
BTN=BTN_TRIGGER_HAPPY4 # where to remap key

sudo /bin/evtest $CONTROLLER1_LOCATION EV_KEY 300 \
        | grep "300.*value" --line-buffered \
        | grep --line-buffered -o "[01]$" \
        | while read x ; do sudo evemu-event /dev/input/$CONTROLLER1_EVENT_PORT --type EV_KEY --code $BTN --value $x ; done

