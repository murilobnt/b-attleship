#ifndef _Game_h
#define _Game_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Ship_ctx.h"
#include "Dimensions_ctx.h"
#include "Ship_type_ctx.h"
#include "Grid_cell.h"
#include "Attack_who_ctx.h"

/* Clause INCLUDES */
#include "Attack_grid.h"
#include "Player_ships.h"

/* Clause IMPORTS */
#include "Attack_grid.h"
#include "Player_ships.h"
#define Game__get_attack_grid1 Attack_grid__get_attack_grid1
#define Game__get_attack_grid2 Attack_grid__get_attack_grid2

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Game__vertical,
    Game__horizontal
    
} Game__ORIENTATION;
#define Game__ORIENTATION__max 2
typedef enum
{
    Game__hit,
    Game__miss,
    Game__destroyed
    
} Game__ATTACK_REPORT;
#define Game__ATTACK_REPORT__max 3

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Game__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Game__check_win_condition(Attack_who_ctx__ATTACK_WHO to, bool *rr);
extern void Game__add_ship(int32_t ii, Game__ORIENTATION oo, int32_t pp);
extern void Game__unlock_attack(void);
extern void Game__attack(int32_t pp, Attack_who_ctx__ATTACK_WHO to, Game__ATTACK_REPORT *rr);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Game_h */
