    processor 6502
    include "vcs.h"
    include "macro.h"

    seg code
    org $f000

Start:
    CLEAN_START ; Macro to safely clear the memory
    lda #$1E ; Load color into A ($1E in NTSC Yellow)
    sta COLOUBK ; Store A to BackgroundColor Address $09
    jmp START

    org $FFFC
    .word Start
    .word Start