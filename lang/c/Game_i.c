/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Game.h"

/* Clause SEES */
#include "Ship_ctx.h"
#include "Dimensions_ctx.h"
#include "Ship_type_ctx.h"
#include "Grid_cell.h"
#include "Attack_who_ctx.h"

/* Clause IMPORTS */
#include "Attack_grid.h"
#include "Player_ships.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Game__ship_health_i[21];
static int32_t Game__grid_to_ship1_i[Dimensions_ctx__grid_sz_for_arr+1];
static int32_t Game__grid_to_ship2_i[Dimensions_ctx__grid_sz_for_arr+1];
static bool Game__attacked1_i[Dimensions_ctx__grid_sz_for_arr+1];
static bool Game__attacked2_i[Dimensions_ctx__grid_sz_for_arr+1];
static int32_t Game__to_be_destroyed_i[81];
static int32_t Game__aux_array[5];
static bool Game__ready_i;
/* Clause INITIALISATION */
void Game__INITIALISATION(void)
{
    
    unsigned int i = 0;
    Attack_grid__INITIALISATION();
    Player_ships__INITIALISATION();
    for(i = 0; i <= 20;i++)
    {
        Game__ship_health_i[i] = 0;
    }
    {
        int32_t ii;
        
        ii = 0;
        Game__ship_health_i[ii] = Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[ii]];
        while((ii) < (20))
        {
            Game__ship_health_i[ii] = Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[ii]];
            ii = ii+1;
        }
    }
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Game__grid_to_ship1_i[i] = Ship_ctx__water_c;
    }
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Game__grid_to_ship2_i[i] = Ship_ctx__water_c;
    }
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Game__attacked1_i[i] = false;
    }
    for(i = 0; i <= Dimensions_ctx__grid_sz_for_arr;i++)
    {
        Game__attacked2_i[i] = false;
    }
    for(i = 0; i <= 80;i++)
    {
        Game__to_be_destroyed_i[i] = 0;
    }
    for(i = 0; i <= 4;i++)
    {
        Game__aux_array[i] = 0;
    }
    Game__ready_i = false;
}

/* Clause OPERATIONS */

void Game__check_win_condition(Attack_who_ctx__ATTACK_WHO to, bool *rr)
{
    if(to == Attack_who_ctx__p1)
    {
        {
            bool ret;
            
            Player_ships__is_empty_1(&ret);
            if(ret == true)
            {
                (*rr) = true;
            }
            else
            {
                (*rr) = false;
            }
        }
    }
    else
    {
        {
            bool ret;
            
            Player_ships__is_empty_2(&ret);
            if(ret == true)
            {
                (*rr) = true;
            }
            else
            {
                (*rr) = false;
            }
        }
    }
}

void Game__add_ship(int32_t ii, Game__ORIENTATION oo, int32_t pp)
{
    {
        bool bb;
        int32_t ss;
        
        Player_ships__belongs_to_1(ii, &bb);
        ss = Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[ii]]-1;
        if(bb == true)
        {
            if(oo == Game__horizontal)
            {
                {
                    int32_t xx;
                    int32_t tt;
                    int32_t init;
                    
                    xx = 0;
                    tt = pp;
                    init = tt;
                    Game__grid_to_ship1_i[tt] = ii;
                    while((xx) < (ss))
                    {
                        tt = tt+1;
                        Game__grid_to_ship1_i[tt] = ii;
                        xx = xx+1;
                    }
                }
            }
            else
            {
                {
                    int32_t xx;
                    int32_t tt;
                    int32_t init;
                    
                    xx = 0;
                    tt = pp;
                    init = tt;
                    Game__grid_to_ship1_i[tt] = ii;
                    while((xx) < (ss))
                    {
                        tt = tt+Dimensions_ctx__grid_dim_y;
                        Game__grid_to_ship1_i[tt] = ii;
                        xx = xx+1;
                    }
                }
            }
        }
        else
        {
            if(oo == Game__horizontal)
            {
                {
                    int32_t xx;
                    int32_t tt;
                    int32_t init;
                    
                    xx = 0;
                    tt = pp;
                    init = tt;
                    Game__grid_to_ship2_i[tt] = ii;
                    while((ii) < (ss))
                    {
                        tt = tt+xx;
                        xx = xx+1;
                        Game__grid_to_ship2_i[tt] = ii;
                    }
                }
            }
            else
            {
                {
                    int32_t xx;
                    int32_t tt;
                    int32_t init;
                    
                    xx = 0;
                    tt = pp;
                    init = tt;
                    Game__grid_to_ship2_i[tt] = ii;
                    while((ii) < (ss))
                    {
                        tt = tt+(xx * Dimensions_ctx__grid_dim_y);
                        xx = xx+1;
                        Game__grid_to_ship2_i[tt] = ii;
                    }
                }
            }
        }
    }
}

void Game__unlock_attack(void)
{
    Game__ready_i = true;
}

void Game__attack(int32_t pp, Attack_who_ctx__ATTACK_WHO to, Game__ATTACK_REPORT *rr)
{
    if(to == Attack_who_ctx__p1)
    {
        {
            int32_t gs;
            
            gs = Game__grid_to_ship1_i[pp];
            if((gs) != (Ship_ctx__water_c))
            {
                Game__ship_health_i[gs] = Game__ship_health_i[gs]-1;
                {
                    int32_t sh;
                    
                    sh = Game__ship_health_i[gs];
                    if(sh == 0)
                    {
                        (*rr) = Game__destroyed;
                        {
                            int32_t ii;
                            int32_t ss;
                            
                            ii = 0;
                            ss = Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[gs]];
                            while((ii) < (ss))
                            {
                                Game__aux_array[ii] = Game__to_be_destroyed_i[(gs * 4)+ii];
                                Attack_grid__update_atk_grid(Game__aux_array[ii], Grid_cell__destroyed_ship, to);
                                ii = ii+1;
                            }
                        }
                        Player_ships__remove_ship_from_1(gs);
                        Game__grid_to_ship1_i[pp] = Ship_ctx__water_c;
                    }
                    else
                    {
                        (*rr) = Game__hit;
                        Game__to_be_destroyed_i[(gs * 4)+(Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[gs]]-sh)] = pp;
                        Attack_grid__update_atk_grid(pp, Grid_cell__ship, to);
                        Game__grid_to_ship1_i[pp] = Ship_ctx__water_c;
                    }
                }
            }
            else
            {
                (*rr) = Game__miss;
                Attack_grid__update_atk_grid(pp, Grid_cell__water, to);
            }
        }
        Game__attacked1_i[pp] = true;
    }
    else
    {
        {
            int32_t gs;
            
            gs = Game__grid_to_ship2_i[pp];
            if((gs) != (Ship_ctx__water_c))
            {
                Game__ship_health_i[gs] = Game__ship_health_i[gs]-1;
                {
                    int32_t sh;
                    
                    sh = Game__ship_health_i[gs];
                    if(sh == 0)
                    {
                        (*rr) = Game__destroyed;
                        {
                            int32_t ii;
                            int32_t ss;
                            
                            ii = 0;
                            ss = Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[gs]];
                            while((ii) < (ss))
                            {
                                Game__aux_array[ii] = Game__to_be_destroyed_i[(gs * 4)+ii];
                                Attack_grid__update_atk_grid(Game__aux_array[ii], Grid_cell__destroyed_ship, to);
                                ii = ii+1;
                            }
                        }
                        Player_ships__remove_ship_from_2(gs);
                        Game__grid_to_ship2_i[pp] = Ship_ctx__water_c;
                    }
                    else
                    {
                        (*rr) = Game__hit;
                        Game__to_be_destroyed_i[(gs * 4)+(Ship_type_ctx__ship_size[Ship_ctx__ship_type_r[gs]]-sh)] = pp;
                        Attack_grid__update_atk_grid(pp, Grid_cell__ship, to);
                        Game__grid_to_ship2_i[pp] = Ship_ctx__water_c;
                    }
                }
            }
            else
            {
                (*rr) = Game__miss;
                Attack_grid__update_atk_grid(pp, Grid_cell__water, to);
            }
        }
        Game__attacked2_i[pp] = true;
    }
}

