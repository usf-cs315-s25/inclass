#include <stdint.h>
#include <stdio.h>

int add2_s(int, int);

#define A0 10
#define A1 11
#define RA 1

struct rv_state {
    uint64_t regs[32];
    uint64_t pc;
};

void rv_init(struct rv_state *state, uint32_t *code, uint64_t a0, uint64_t a1) {
    state->pc = (uint64_t)code;
    state->regs[A0] = a0; // set up emulated function args
    state->regs[A1] = a1;
    state->regs[RA] = 0; // sentinel value to know when we're done
}

void rv_r_type(struct rv_state *state, uint32_t iw) {
    uint32_t rd = (iw >> 7) & 0b11111; // equiv: 0x1F
    uint32_t rs1 = (iw >> 15) & 0x1F;
    uint32_t rs2 = (iw >> 20) & 0x1F;
    uint32_t func3 = (iw >> 12) & 0b111;
    uint32_t func7 = (iw >> 25) & 0x7F; // equiv: 0b1111111

    switch (func3) {
    case 0: // add or sub
        if (func7 == 0) {
            // add
            state->regs[rd] = state->regs[rs1] + state->regs[rs2];
        }
        break;
    default:
        printf("unknown r-type func3: %d\n", func3);
    }

    state->pc += 4;
}

void rv_jalr(struct rv_state *state, uint32_t iw) {
    uint32_t rd = (iw >> 7) & 0b11111;
    uint32_t rs1 = (iw >> 15) & 0b11111;

    // no need to mask since unsigned means logical shift
    // which produces zeros for new bits filled left
    uint32_t offset = (iw >> 20);

    // printf("rd = %X\n, rs1 = %d\n, offset = %X\n", rd, rs1, offset);
    state->pc = state->regs[rs1] + offset;
}

void rv_one(struct rv_state *state, uint32_t iw) {
    uint32_t opcode = iw & 0b1111111;
    switch (opcode) {
    case 0b0110011: // r-type opcode
        rv_r_type(state, iw);
        break;
    case 0b1100111: // jalr (aka ret)
        rv_jalr(state, iw);
        break;
    default:
        printf("Unknown opcode: %X\n", opcode);
    }
}

int main(int argc, char **argv) {
    // local variable for RISC-V processor state
    struct rv_state state;

    // code points to the instruction words for add2_s
    uint32_t *code = (uint32_t *)&add2_s;

    // initialize state with the code we want to emulate and some
    // parameter arguments
    rv_init(&state, code, 1, 2);

    while (state.pc != 0) {
        uint32_t *pInstrs = (uint32_t *)state.pc;
        uint32_t iw = *pInstrs;

        // equiv: uint32_t iw = *(uint32_t*)state.pc;

        rv_one(&state, iw);
    }
}
