/* UseCase
 * Author: muril
 * Creation date: 10/06/2019
 */
MACHINE
    UseCase
    
SEES
    Attack_who_ctx
    
VARIABLES
    player_turn
    
INVARIANT
    player_turn : ATTACK_WHO
    
INITIALISATION
    player_turn :: ATTACK_WHO
    
OPERATIONS
    pt <-- get_player_turn =
    pt := player_turn;
        
    change_turn =
    IF player_turn = p1 THEN
        player_turn := p2
    ELSE
        player_turn := p1
    END
END
