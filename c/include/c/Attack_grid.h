#ifndef _Attack_grid_h
#define _Attack_grid_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Grid_cell.h"
#include "Dimensions_ctx.h"
#include "Attack_who_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Attack_grid__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Attack_grid__update_atk_grid(int32_t pp, Grid_cell__CELL cc, Attack_who_ctx__ATTACK_WHO to);
extern void Attack_grid__update_atk_grid_for_destroyed_ship(int32_t *pp, Attack_who_ctx__ATTACK_WHO to, int32_t sz);
extern void Attack_grid__get_attack_grid1(Grid_cell__CELL *ag);
extern void Attack_grid__get_attack_grid2(Grid_cell__CELL *ag);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Attack_grid_h */
