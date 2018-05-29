SETUP_LEDS:
        orr r0,GPIO_OFFSET

        ;GPIO27
        mov r11,#1
        lsl r11,#21;function enable bit

        ;GPIO22
        mov r4,#1
        lsl r4,#6
        orr r11,r4;adding all GPIO function enable bits together in GPIO 20-29

        ;GPIO23
        mov r4,#1
        lsl r4,#9
        orr r11,r4

        ;GPIO24
        mov r4,#1
        lsl r4,#12
        orr r11,r4

        str r11,[r0,#8];storing all GPIO function enable bits in 20-29

        ;GPIO17 Input
       ; mov r5,#0
       ; lsl r5,#21
       ; str r5,[r0,#4]
       ldr r10,[r0,#4] ;read function register for GPIO 10 - 19
       bic r10,r10,#27  ;bit clear  27 = 9 * 3    = read access
       str r10,[r0,#4];10 input

bx lr

LED1ON:
        ;activate LED 1 27
        mov r11,#1
        lsl r11,#27  ;bit 27 to write to GPIO27
        str r11,[r0,#28]
bx lr

LED2ON:
        ;activate LED 2 22
        mov r11,#1
        lsl r11,#22
        str r11,[r0,#28]
bx lr

LED3ON:
        ;activate LED 3 23
        mov r11,#1
        lsl r11,#23
        str r11,[r0,#28]
bx lr

LED4ON:
        ;activate LED 4 24
        mov r11,#1
        lsl r11,#24
        str r11,[r0,#28]
bx lr

LED1OFF:
        ;activate LED 1 27
        mov r11,#1
        lsl r11,#27  ;bit 27 to write to GPIO27
        str r11,[r0,#40]
bx lr

LED2OFF:
        ;activate LED 2 22
        mov r11,#1
        lsl r11,#22
        str r11,[r0,#40]
bx lr

LED3OFF:
        ;activate LED 3 23
        mov r11,#1
        lsl r11,#23
        str r11,[r0,#40]
bx lr

LED4OFF:
        ;activate LED 4 24
        mov r11,#1
        lsl r11,#24
        str r11,[r0,#40]
bx lr