/*

Test-cases for strip_color_codes function

*/

#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

#include "debug.h"
#define PAYLOAD "dummy"

static void empty_string(void **state) {
    (void) state; /* unused */
    char *sut = "";
    char *exp = "";
    strip_color_codes(sut);
    assert_string_equal(sut, exp);
}

static void remove_cXXX_code(void **state) {
    (void) state; /* unused */
    char *sut = cBLK PAYLOAD;
    char *exp = PAYLOAD;
    strip_color_codes(sut);
    assert_string_equal(sut, exp);
}

  /*
  Parameterize to test if strip_color_codes...
    removes cBLK, cRED, cGRN, cBRN, cBLU, cMGN, cCYA, cLGR, cGRA, cLRD, cLGN, cYEL, cLBL, cPIN, cLCY, cBRI, cRST
    removes bgBLK, bgRED, bgGRN, bgBRN, bgBLU, bgMGN, bgCYA, bgLGR, bgGRA, bgLRD, bgLGN, bgYEL, bgLBL, bgPIN, bgLCY, bgBRI,
    does not remove "\x1b[H", "\x1b[2J", "\x1b[0K", "\x1b[?25l", "\x1b[?25h"
  */

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(empty_string),
        cmocka_unit_test(remove_cXXX_code),
    };
    return cmocka_run_group_tests(tests, NULL, NULL);
}
