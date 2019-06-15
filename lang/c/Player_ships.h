#ifndef _Player_ships_h
#define _Player_ships_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Ship_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Player_ships__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Player_ships__remove_ship_from_1(int32_t ss);
extern void Player_ships__remove_ship_from_2(int32_t ss);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Player_ships_h */
