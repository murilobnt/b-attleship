/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Attack_grid.h"

/* Clause SEES */
#include "Grid_cell.h"
#include "Dimensions_ctx.h"
#include "Attack_who_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static Grid_cell__CELL Attack_grid__atk_grid1_i[Dimensions_ctx__grid_sz_for_arr+1];
static Grid_cell__CELL Attack_grid__atk_grid2_i[Dimensions_ctx__grid_sz_for_arr+1];
/* Clause INITIALISATION */
void Attack_grid__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Attack_grid__atk_grid1_i[i] = Grid_cell__undiscovered;
    }
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Attack_grid__atk_grid2_i[i] = Grid_cell__undiscovered;
    }
}

/* Clause OPERATIONS */

void Attack_grid__update_atk_grid(int32_t pp, Grid_cell__CELL cc, Attack_who_ctx__ATTACK_WHO to)
{
    if(to == Attack_who_ctx__p1)
    {
        Attack_grid__atk_grid1_i[pp] = cc;
    }
    else
    {
        Attack_grid__atk_grid2_i[pp] = cc;
    }
}

void Attack_grid__update_atk_grid_for_destroyed_ship(int32_t *pp, Attack_who_ctx__ATTACK_WHO to, int32_t sz)
{
    if(to == Attack_who_ctx__p1)
    {
        {
            int32_t ii;
            int32_t nsz;
            
            ii = 0;
            nsz = sz-1;
            Attack_grid__atk_grid1_i[pp[ii]] = Grid_cell__destroyed_ship;
            while(((ii) < (nsz)))
            {
                ii = ii+1;
                Attack_grid__atk_grid1_i[pp[ii]] = Grid_cell__destroyed_ship;
            }
        }
    }
    else
    {
        {
            int32_t ii;
            int32_t nsz;
            
            ii = 0;
            nsz = sz-1;
            Attack_grid__atk_grid2_i[pp[ii]] = Grid_cell__destroyed_ship;
            while(((ii) < (nsz)))
            {
                ii = ii+1;
                Attack_grid__atk_grid2_i[pp[ii]] = Grid_cell__destroyed_ship;
            }
        }
    }
}

void Attack_grid__get_attack_grid1(Grid_cell__CELL *ag)
{
    memmove(ag,Attack_grid__atk_grid1_i,(Dimensions_ctx__grid_sz_for_arr+1)* sizeof(Grid_cell__CELL));
}

void Attack_grid__get_attack_grid2(Grid_cell__CELL *ag)
{
    memmove(ag,Attack_grid__atk_grid2_i,(Dimensions_ctx__grid_sz_for_arr+1)* sizeof(Grid_cell__CELL));
}

