#include <stdint.h>
#include <stdio.h>

#define A0 10
#define A1 11
#define RA 1

int add2_s(int, int);

struct rv_state {
    uint64_t regs[32];
    uint64_t pc;
};

void rv_init(struct rv_state *state, uint32_t *code, uint64_t a0, uint64_t a1) {
    // addr of the code we want to emulate
    state->pc = (uint64_t)code;

    // arguments to this function
    state->regs[A0] = a0;
    state->regs[A1] = a1;

    // ra holds a sentinel value so we know when to stop the emulation
    state->regs[RA] = 0;
}

void rv_r_type(struct rv_state *state, uint32_t iw) {
    uint32_t rd = (iw >> 7) & 0b11111;   // equiv: 0x1F
    uint32_t func3 = (iw >> 12) & 0b111; // extract func3
    uint32_t rs1 = (iw >> 15) & 0b11111; // extract source reg names
    uint32_t rs2 = (iw >> 20) & 0b11111;
    uint32_t func7 = (iw >> 25) & 0x7F;

    switch (func3) {
    case 0:
        if (func7 == 0) {
            // add
            state->regs[rd] = state->regs[rs1] + state->regs[rs2];
        } else {
            // subtract
        }
        break;
    }
    state->pc += 4;
}

void rv_jalr(struct rv_state *state, uint32_t iw) {
    uint32_t rd = (iw >> 7) & 0b11111;
    uint32_t func3 = (iw >> 12) & 0b111;
    uint32_t rs1 = (iw >> 15) & 0b11111;
    uint32_t imm = (iw >> 20);

    // PC = RA
    state->pc = state->regs[rs1] + imm;

    // printf("rd = %d\n, func3 = %d\n, rs1 = %d\n, imm = %d\n", rd, func3, rs1,
    // imm);
}

void rv_one(struct rv_state *state, uint32_t iw) {
    uint32_t opcode = iw & 0b1111111;

    switch (opcode) {
    case 0b0110011: // r-type instruction
        rv_r_type(state, iw);
        break;
    case 0b1100111: // jalr
        rv_jalr(state, iw);
        break;
    default:
        printf("unknown opcode: %x\n", opcode);
    }
}

int main(int argc, char **argv) {
    uint32_t *code = (uint32_t *)&add2_s;

    struct rv_state state;
    uint64_t a0 = 2;
    uint64_t a1 = 3;
    rv_init(&state, code, a0, a1);

    while (state.pc != 0) {
        uint32_t *inst_ptr = (uint32_t *)state.pc;
        uint32_t iw = *inst_ptr;

        // equiv: inst_ptr = *(uint32_t*) state.pc

        rv_one(&state, iw);
    }
}
