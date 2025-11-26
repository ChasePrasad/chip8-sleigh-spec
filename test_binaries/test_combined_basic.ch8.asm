# CHIP-8 Test Script: Basic Operations
# Tests basic load, arithmetic, and control flow instructions
# Combines Murali's and Cher's instructions

: main
    # Cher: LD I, addr - Load address into I register
    i := 0x300
    
    # Murali: LD Vx, byte - Load immediate values into registers
    v0 := 0x42
    v1 := 0x10
    v2 := 0x05
    
    # Murali: LD Vx, Vy - Copy register values
    v3 := v0
    v4 := v1
    
    # Murali: ADD I, Vx - Add register to I
    i += v2
    
    # Cher: SUB Vx, Vy - Subtract registers (v4 = v4 - v2)
    v4 -= v2
    
    # Cher: OR Vx, Vy - Bitwise OR
    v0 |= v1
    
    # Cher: AND Vx, Vy - Bitwise AND
    v3 &= v2
    
    # Murali: SE Vx, byte - Skip if equal to immediate
    if v1 != 0x10 then
    v5 := 0xFF  # This should be skipped
    
    # Murali: SE Vx, Vy - Skip if registers equal
    v6 := 0x42
    v7 := 0x42
    if v6 != v7 then
    v8 := 0xAA  # This should be skipped
    
    # Loop forever
: end_loop
    jump0 end_loop
