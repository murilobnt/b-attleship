#ifndef _Grid_cell_h
#define _Grid_cell_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Grid_cell__undiscovered,
    Grid_cell__water,
    Grid_cell__ship,
    Grid_cell__destroyed_ship
    
} Grid_cell__CELL;
#define Grid_cell__CELL__max 4

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Grid_cell__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Grid_cell_h */
