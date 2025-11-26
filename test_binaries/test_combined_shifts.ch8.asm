# CHIP-8 Test Script: Shift and Arithmetic Operations
# Tests bit manipulation instructions
# Combines Murali's and Cher's instructions

: main
    # Cher: LD I, addr
    i := 0x300
    
    # Test shift right (SHR)
    # Murali: LD Vx, byte
    v0 := 0x0F  # 00001111 binary
    
    # Murali: SHR Vx - Shift right, LSB goes to vF
    v0 >>= v0       # Should become 0x07, vF=1 (LSB was 1)
    
    # Test shift left (SHL)
    v1 := 0xF0  # 11110000 binary
    
    # Murali: SHL Vx - Shift left, MSB goes to vF
    v1 <<= v1       # Should become 0xE0, vF=1 (MSB was 1)
    
    # Cher: SUBN - Reverse subtract (vx = vy - vx)
    v2 := 0x10
    v3 := 0x30
    v2 =- v3  # v2 = v3 - v2 = 0x30 - 0x10 = 0x20, vF=1 (no borrow)
    
    # Test with borrow
    v4 := 0x50
    v5 := 0x20
    v4 =- v5  # v4 = v5 - v4 = 0x20 - 0x50 (underflow), vF=0 (borrow)
    
    # Cher: LD Vx, DT - Load delay timer
    v6 := delay
    
: end_loop
    v0 := 0x00
    jump0 end_loop
