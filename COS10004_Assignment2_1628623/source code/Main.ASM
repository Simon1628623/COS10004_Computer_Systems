Main:
        ;start turn off all but red led and wait for button press
        loop$:
                bl LED1OFF
                bl LED2OFF
                bl LED3OFF
                bl LED4ON

                ldr r9,[r0,#52] ;read gpios 0-31
                tst r9,#1024  ; use tst to check bit 10
        bne start$ ; if ==0
        b loop$


        ;once green light/last led has gone off count up time delay before button released
        checkloop$:

                add r2,#1

                ldr r9,[r0,#52] ;read gpios 0-31
                tst r9,#1024  ; use tst to check bit 10
        beq displayloop$ ; if ==1
        b checkloop$

        ;display delay between button release and green light
        displayloop$:
                bl LED1OFF
                bl LED2OFF
                bl LED3OFF
                mov r3,r2
                mov r2,$2D0000
                orr r2,$00C600
                orr r2,$000C0   ;TIMER_MICROSECONDS = 500,000
                bl TIMER
                bl LED1ON
                bl LED2ON
                bl LED3ON
                mov r2,r3
                bl TIMER


        b loop$

        start$:
                bl LED4OFF
               ; bl TimerDelay
                mov r2,$2D0000
                orr r2,$00C600
                orr r2,$000C0   ;TIMER_MICROSECONDS = 500,000
                bl TIMER
        b led1$

        led1$:
                bl LED1ON
               ; bl TimerDelay
                mov r2,$2D0000
                orr r2,$00C600
                orr r2,$000C0   ;TIMER_MICROSECONDS = 500,000
                bl TIMER
                ldr r9,[r0,#52] ;read gpios 0-31
                tst r9,#1024  ; use tst to check bit 10
        bne led2$ ; if ==0
        b loop$

        led2$:
                bl LED2ON
               ; bl TimerDelay
                mov r2,$2D0000
                orr r2,$00C600
                orr r2,$000C0   ;TIMER_MICROSECONDS = 500,000
                bl TIMER

                ldr r9,[r0,#52] ;read gpios 0-31
                tst r9,#1024  ; use tst to check bit 10
        bne led3$ ; if ==0
        b loop$

        led3$:
                bl LED3ON
        mov r2,#0
        b checkloop$
bx lr

TimerDelay:
       ; mov r2,$2D0000
       ; orr r2,$00C600
       ; orr r2,$000C0   ;TIMER_MICROSECONDS = 500,000
       ; push {lr}
       ; bl TIMER
       ; pop {lr}

      ; loop2$:
      ; ldrd r6,r7,[r3,#4]
      ; sub r8,r6,r5
      ; cmp r8,r4
      ; bls loop2$

       ;smart timer
      ; push {r0-r3}
      ; mov r0,BASE
      ; mov r1,$70000
      ; orr r1,$0A100
      ; orr r1,$00020   ;TIMER_MICROSECONDS = 500,000
      ; bl Delay
      ; pop {r0-r3}
bx lr

Counter:
    mov r2,#1
  wait2$:
    add r2,#1
    cmp r2,r3
    bne wait2$
bx lr