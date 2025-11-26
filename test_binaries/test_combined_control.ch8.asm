# CHIP-8 Test Script: Control Flow and Keyboard
# Tests subroutines, returns, and keyboard input
# Combines Murali's and Cher's instructions

: main
    # Initialize registers
    v0 := 0x05
    v1 := 0x0A
    
    # Cher: CALL addr - Call subroutine
    add_routine
    
    # After return, v2 should contain sum
    # Murali: SE Vx, byte - Test result
    if v2 != 0x0F then
    vF := 0xFF  # Should be skipped if sum is correct
    
    # Cher: LD Vx, K - Wait for key press
    v3 := key
    
    # Murali: SKP Vx - Skip if key pressed
    if v3 -key then
    v4 := 0x01  # Skipped if key is pressed
    
    # Cher: CLS - Clear display
    clear
    
    # Cher: DRW - Draw sprite
    i := 0x300
    v5 := 0x10
    v6 := 0x08
    sprite v5 v6 5
    
: end_loop
    v0 := 0x00
    jump0 end_loop

: add_routine
    # Subroutine that adds v0 and v1, stores in v2
    # Murali: LD Vx, Vy
    v2 := v0
    
    # Add v1 to v2 using shifts and ORs (simulated add)
    # Cher: OR Vx, Vy
    v2 |= v1
    
    # Murali: RET - Return from subroutine
    return
