format binary as 'img'  ;must be first
BASE = $3F000000 ;RP2 and RP3 ;GPIO_SETUP
GPIO_OFFSET = $200000

mov r0,BASE
bl SETUP_LEDS

bl Main

include "Main.asm"
include "TIMER.asm"
include "timer2_2Param.asm"
include "GPIO_Init.asm"