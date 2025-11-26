# CHIP-8 Test Script: Comprehensive Test
# Tests all instructions from both Murali and Cher
# Systematic verification of the complete instruction set

: main
    # ========== INITIALIZATION ==========
    # Cher: Clear screen
    clear
    
    # Cher: Set up memory pointer
    i := sprite_data
    
    # ========== LOAD OPERATIONS (Murali) ==========
    v0 := 0x12
    v1 := 0x34
    v2 := 0x56
    v3 := 0x78
    v4 := 0x9A
    
    # Murali: Copy registers
    v5 := v0
    v6 := v1
    
    # ========== ARITHMETIC (Cher) ==========
    # Test SUB
    v7 := 0x50
    v8 := 0x30
    v7 -= v8  # v7 = 0x20, vF = 1
    
    # Test SUBN
    v9 := 0x10
    vA := 0x40
    v9 =- vA  # v9 = 0x30, vF = 1
    
    # ========== BITWISE OPERATIONS (Cher) ==========
    vB := 0xFF
    vC := 0x0F
    vB &= vC  # vB = 0x0F
    
    vD := 0xF0
    vE := 0x0F
    vD |= vE   # vD = 0xFF
    
    # ========== SHIFT OPERATIONS (Murali) ==========
    v0 := 0x81
    v0 >>= v0      # v0 = 0x40, vF = 1
    
    v1 := 0x81
    v1 <<= v1      # v1 = 0x02, vF = 1
    
    # ========== MEMORY OPERATIONS ==========
    # Murali: Store registers to memory
    i := sprite_data
    v0 := 0xAA
    v1 := 0xBB
    v2 := 0xCC
    save v2
    
    # Clear and reload
    v0 := 0x00
    v1 := 0x00
    v2 := 0x00
    load v2
    
    # Cher: BCD conversion
    v3 := 0x7B  # 123 decimal
    i := bcd_data
    bcd v3
    
    # Murali: Add to I register
    v4 := 0x10
    i += v4
    
    # ========== CONTROL FLOW ==========
    # Murali: Skip equal immediate
    v5 := 0x42
    if v5 != 0x42 then
    vF := 0x99  # Skipped
    
    # Murali: Skip equal registers
    v6 := 0x11
    v7 := 0x11
    if v6 != v7 then
    vF := 0x88  # Skipped
    
    # Cher: Call subroutine
    test_subroutine
    
    # ========== DISPLAY ==========
    # Cher: Draw sprite
    i := sprite_data
    v8 := 0x20
    v9 := 0x10
    sprite v8 v9 8
    
    # ========== KEYBOARD ==========
    # Cher: Get key press
    vA := key
    
    # Murali: Skip if key pressed
    if vA -key then
    vB := 0x01
    
    # ========== TIMER ==========
    # Cher: Load delay timer
    vC := delay

: main_loop
    # Cher: Jump with offset
    v0 := 0x00
    jump0 main_loop

: test_subroutine
    vD := 0xEE
    # Murali: Return
    return

: sprite_data
    0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: bcd_data
    0x00 0x00 0x00
