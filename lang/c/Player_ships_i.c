/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Player_ships.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Player_ships__ships1_i[11];
static int32_t Player_ships__ships2_i[11];
/* Clause INITIALISATION */
void Player_ships__INITIALISATION(void)
{
    
    unsigned int i = 0;
    {
        int32_t ii;
        
        ii = 0;
        for(i = 0; i <= 10;i++)
        {
            Player_ships__ships1_i[i] = 20;
        }
        for(i = 0; i <= 10;i++)
        {
            Player_ships__ships2_i[i] = 20;
        }
        while((ii) < (10))
        {
            Player_ships__ships1_i[ii] = ii;
            Player_ships__ships2_i[ii] = ii+10;
            ii = ii+1;
        }
    }
}

/* Clause OPERATIONS */

void Player_ships__remove_ship_from_1(int32_t ss)
{
    if(((ss) >= (0)) &&
    ((ss) <= (9)))
    {
        Player_ships__ships1_i[ss] = 20;
    }
}

void Player_ships__remove_ship_from_2(int32_t ss)
{
    if(((ss) >= (10)) &&
    ((ss) <= (19)))
    {
        Player_ships__ships2_i[ss-10] = 20;
    }
}

