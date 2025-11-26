# CHIP-8 Test Script: Memory Operations
# Tests memory load/store and BCD conversion
# Combines Murali's and Cher's instructions

: main
    # Cher: LD I, addr - Set up memory pointer
    i := 0x400
    
    # Murali: LD Vx, byte - Initialize registers with test values
    v0 := 0x01
    v1 := 0x02
    v2 := 0x03
    v3 := 0x04
    v4 := 0x05
    
    # Murali: LD [I], Vx - Store v0-v4 to memory starting at I
    save v4
    
    # Clear registers to test load
    v0 := 0x00
    v1 := 0x00
    v2 := 0x00
    v3 := 0x00
    v4 := 0x00
    
    # Murali: LD Vx, [I] - Load memory back into v0-v4
    load v4
    
    # Cher: LD B, Vx - Store BCD representation of v4 (value 5)
    v5 := 0xFA  # 250 in decimal
    i := 0x500
    bcd v5
    
    # Test BCD result by loading it back
    i := 0x500
    load v2  # Should load 2, 5, 0 into v0, v1, v2
    
: end_loop
    v0 := 0x00
    jump0 end_loop
