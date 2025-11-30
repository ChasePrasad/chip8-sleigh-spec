; -----------------------------------------------------------------
; CHIP-8 Instruction Test Suite
; -----------------------------------------------------------------

.code

; -----------------------------------------------------------------
; Chase's Instructions
; -----------------------------------------------------------------

JP 0x200        ; Jump to 0x200

SNE V1, 0x22    ; Skip next instruction if V1 != 0x22

SNE V6, V7      ; Skip next instruction if V6 != V7

SKNP V1         ; Skip next if key in V1 is NOT pressed

LD DT, V2       ; Set Delay Timer = V2

LD ST, V3       ; Set Sound Timer = V3

LD F, V5        ; Set I = location of sprite for digit in V5

ADD V5, 0x66    ; Set V5 = V5 + 0x66

ADD V0, V1      ; Set V0 = V0 + V1 (VF = Carry)

XOR V0, V1      ; Set V0 = V0 ^ V1

RND V8, 0xFF    ; Set V8 = Random & 0xFF

; -----------------------------------------------------------------
; Cher's Instructions
; -----------------------------------------------------------------

; SYS 0x300		; Jump to a machine code routine at 0x300 (No longer used)

CALL 0x400      ; Call subroutine at 0x400

JP V0, 0x123    ; Jump to address V0 + 0x123

LD I, 0x890     ; Set I = 0x890

LD V0, DT       ; Set V0 = Delay Timer

LD V1, K        ; Wait for key press, store in V1

LD B, V6        ; Store BCD representation of V6 at I

SUB V0, V1      ; Set V0 = V0 - V1

; SUBN V0, V1	; Set V0 = V1 - V0 (Does not compile)

OR V0, V1       ; Set V0 = V0 | V1

AND V0, V1      ; Set V0 = V0 & V1

CLS             ; Clear display

DRW V0, V1, 5   ; Draw sprite at (V0, V1) height 5

; -----------------------------------------------------------------
; Murali's Instructions
; -----------------------------------------------------------------

RET             ; Return from subroutine

SE V0, 0x11     ; Skip next instruction if V0 == 0x11

SE V2, V3       ; Skip next instruction if V2 == V3

SKP V0          ; Skip next if key in V0 is pressed

LD V4, 0x55     ; Set V4 = 0x55

LD V0, V1       ; Set V0 = V1

LD [I], V7      ; Store registers V0 through V7 in memory starting at I

LD V8, [I]      ; Load registers V0 through V8 from memory starting at I

ADD I, V4       ; Set I = I + V4

SHR V0          ; Shift V0 Right

SHL V0          ; Shift V0 Left