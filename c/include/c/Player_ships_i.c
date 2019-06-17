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

void Player_ships__is_empty_1(bool *rr)
{
    int32_t ii;
    
    ii = 0;
    (*rr) = true;
    while((ii) < (11))
    {
        {
            int32_t val;
            
            val = Player_ships__ships1_i[ii];
            if(((ii) < (10)) &&
            ((val) != (20)))
            {
                (*rr) = false;
            }
        }
        ii = ii+1;
    }
}

void Player_ships__is_empty_2(bool *rr)
{
    int32_t ii;
    
    ii = 0;
    (*rr) = true;
    while((ii) < (11))
    {
        {
            int32_t val;
            
            val = Player_ships__ships2_i[ii];
            if(((ii) < (10)) &&
            ((val) != (20)))
            {
                (*rr) = false;
            }
        }
        ii = ii+1;
    }
}

void Player_ships__belongs_to_1(int32_t pp, bool *rr)
{
    int32_t ii;
    
    ii = 0;
    (*rr) = false;
    while(((ii) < (11)) &&
    ((*rr) == false))
    {
        {
            int32_t val;
            
            val = Player_ships__ships1_i[ii];
            if(((ii) < (10)) &&
            (val == pp))
            {
                (*rr) = true;
            }
        }
        ii = ii+1;
    }
}

void Player_ships__belongs_to_2(int32_t pp, bool *rr)
{
    int32_t ii;
    
    ii = 0;
    (*rr) = false;
    while(((ii) < (11)) &&
    ((*rr) == false))
    {
        {
            int32_t val;
            
            val = Player_ships__ships2_i[ii];
            if(((ii) < (10)) &&
            (val == pp))
            {
                (*rr) = true;
            }
        }
        ii = ii+1;
    }
}

