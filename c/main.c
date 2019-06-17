#include <stdio.h>
#include "Attack_who_ctx.h"
#include "Ship_type_ctx.h"
#include "Game.h"

void print_attack_grid(Attack_who_ctx__ATTACK_WHO player){
  Grid_cell__CELL ag[Dimensions_ctx__grid_sz_for_arr+1];
  player == Attack_who_ctx__p1 ? Attack_grid__get_attack_grid1(ag) :
                                 Attack_grid__get_attack_grid2(ag);
   for(int i = 0; i < Dimensions_ctx__grid_dim_y; ++i){
     printf("| ");
     for(int j = 0; j < Dimensions_ctx__grid_dim_x; ++j){
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__undiscovered)
        printf("-");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__water)
        printf("w");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__ship)
        printf("o");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__destroyed_ship)
        printf("x");
     }
     printf(" |\n");
   }
}

bool game_turn(Attack_who_ctx__ATTACK_WHO player) {
  print_attack_grid(player);
  char who = (player == Attack_who_ctx__p1 ? '1' : '2');
  printf("Jogador %c, escolha uma posição para atacar (x y).", who);
  int32_t pos1, pos2, pos;
  scanf("%i %i", &pos1, &pos2);
  pos = (pos1 - 1) + ((pos2 - 1) * 10);
  Game__ATTACK_REPORT result;
  Game__attack(pos, (player == Attack_who_ctx__p1 ? Attack_who_ctx__p2 : Attack_who_ctx__p1), &result);
  if(result == Game__hit)
    printf("O seu ataque acertou um navio inimigo!");
  if(result == Game__miss)
    printf("O seu ataque não acertou nenhum navio inimigo.");
  if(result == Game__destroyed)
    printf("O seu ataque destruiu um navio inimigo!");

  bool win;
  Game__check_win_condition(player, &win);
  if(win){
     printf("O jogador %c venceu!", who);
     return 1;
  }
  return 0;
}

void print_grid_to_ship(){
  for(int i = 0; i < Dimensions_ctx__grid_dim_y; ++i){
    for(int j = 0; j < Dimensions_ctx__grid_dim_x; ++j){
      // PRINT_CELL (fazer operação para retornar o grid_to_ship)
    }
  }
}

void position_ships_for_p1(){
  printf("Jogador 1, posicione os seus navios.\n");
  for(int32_t i = 0; i < 10; ++i){
    // PRINT_GRID_TO_SHIP
    if(i == 0){
      printf("Posicionar navio: Encouraçado. Tamanho: 4.\n");
    }
    else if (i > 0 & i < 3){
      printf("Posicionar navio: Cruzador. Tamanho: 3.\n");
    }
    else if (i >= 3 & i < 6){
      printf("Posicionar navio: Destroyer. Tamanho: 2.\n");
    }
    else {
      printf("Posicionar navio: Submarino. Tamanho: 1.\n");
    }

    int32_t pos1, pos2, pos, horizontal;
    // do {
      printf("Escolha uma posição para colocar o navio (x), (y), (0: horizontal, 1: vertical): ");
      scanf("%i %i %i", &pos1, &pos2, &horizontal);
      // if(error) printf("Desculpe, você não pode colocar este navio nessa posição.")
    // } while(error);
    // ADD_SHIP(i, pos, horizontal);
    pos = (pos1 - 1) + ((pos2 - 1) * 10);
    if(!horizontal){
      Game__add_ship(i, Game__horizontal, pos);
    } else {
      Game__add_ship(i, Game__vertical, pos);
    }
  }
}

void position_ships_for_p2() {
  printf("Jogador 2, posicione os seus navios.\n");
  for(int32_t i = 10; i < 20; ++i){
    // PRINT_GRID_TO_SHIP
    if(i == 10){
      printf("Posicionar navio: Encouraçado. Tamanho: 4.\n");
    }
    else if (i > 10 & i < 13){
      printf("Posicionar navio: Cruzador. Tamanho: 3.\n");
    }
    else if (i >= 13 & i < 16){
      printf("Posicionar navio: Destroyer. Tamanho: 2.\n");
    }
    else {
      printf("Posicionar navio: Submarino. Tamanho: 1.\n");
    }

    int32_t pos1, pos2, pos, horizontal;
    // do {
      printf("Escolha uma posição para colocar o navio (x), (y), (0: horizontal, 1: vertical): ");
      scanf("%i %i %i", &pos1, &pos2, &horizontal);
      pos = (pos1 - 1) + ((pos2 - 1) * 10);
      // if(error) printf("Desculpe, você não pode colocar este navio nessa posição.")
      // Retornar error de Add_ship ou Attack.
    // } while(error);
    if(!horizontal){
      Game__add_ship(i, Game__horizontal, pos);
    } else {
      Game__add_ship(i, Game__vertical, pos);
    }
  }
}

int main(){
  printf("##### B-attleship #####\n");
  Game__INITIALISATION();
  position_ships_for_p1();
  position_ships_for_p2();
  Game__unlock_attack();
  while(1){
    if(game_turn(Attack_who_ctx__p1)) break;
    if(game_turn(Attack_who_ctx__p2)) break;
  }
  return 0;
}
