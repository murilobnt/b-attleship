Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Game))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Game))==(Machine(Game));
  Level(Machine(Game))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Game)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Game))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Game))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Game))==(?);
  List_Includes(Machine(Game))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Game))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Game))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Game))==(?);
  Context_List_Variables(Machine(Game))==(?);
  Abstract_List_Variables(Machine(Game))==(?);
  Local_List_Variables(Machine(Game))==(player);
  List_Variables(Machine(Game))==(player);
  External_List_Variables(Machine(Game))==(player)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Game))==(?);
  Abstract_List_VisibleVariables(Machine(Game))==(?);
  External_List_VisibleVariables(Machine(Game))==(?);
  Expanded_List_VisibleVariables(Machine(Game))==(?);
  List_VisibleVariables(Machine(Game))==(?);
  Internal_List_VisibleVariables(Machine(Game))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Game))==(btrue);
  Gluing_List_Invariant(Machine(Game))==(btrue);
  Expanded_List_Invariant(Machine(Game))==(btrue);
  Abstract_List_Invariant(Machine(Game))==(btrue);
  Context_List_Invariant(Machine(Game))==(btrue);
  List_Invariant(Machine(Game))==(player: PLAYER)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Game))==(btrue);
  Abstract_List_Assertions(Machine(Game))==(btrue);
  Context_List_Assertions(Machine(Game))==(btrue);
  List_Assertions(Machine(Game))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Game))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Game))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Game))==(@(player$0).(player$0: PLAYER ==> player:=player$0));
  Context_List_Initialisation(Machine(Game))==(skip);
  List_Initialisation(Machine(Game))==(player:: PLAYER)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Game))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Game))==(btrue);
  List_Constraints(Machine(Game))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Game))==(get_player);
  List_Operations(Machine(Game))==(get_player)
END
&
THEORY ListInputX IS
  List_Input(Machine(Game),get_player)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Game),get_player)==(pp)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Game),get_player)==(pp <-- get_player)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Game),get_player)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Game),get_player)==(btrue | pp:=player);
  List_Substitution(Machine(Game),get_player)==(pp:=player)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Game))==(?);
  Inherited_List_Constants(Machine(Game))==(?);
  List_Constants(Machine(Game))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Game),PLAYER)==(?);
  Context_List_Enumerated(Machine(Game))==(?);
  Context_List_Defered(Machine(Game))==(?);
  Context_List_Sets(Machine(Game))==(?);
  List_Valuable_Sets(Machine(Game))==(PLAYER);
  Inherited_List_Enumerated(Machine(Game))==(?);
  Inherited_List_Defered(Machine(Game))==(?);
  Inherited_List_Sets(Machine(Game))==(?);
  List_Enumerated(Machine(Game))==(?);
  List_Defered(Machine(Game))==(PLAYER);
  List_Sets(Machine(Game))==(PLAYER)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Game))==(?);
  Expanded_List_HiddenConstants(Machine(Game))==(?);
  List_HiddenConstants(Machine(Game))==(?);
  External_List_HiddenConstants(Machine(Game))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Game))==(btrue);
  Context_List_Properties(Machine(Game))==(btrue);
  Inherited_List_Properties(Machine(Game))==(btrue);
  List_Properties(Machine(Game))==(PLAYER: FIN(INTEGER) & not(PLAYER = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Game),get_player)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Game)) == (PLAYER | ? | player | ? | get_player | ? | ? | ? | Game);
  List_Of_HiddenCst_Ids(Machine(Game)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Game)) == (?);
  List_Of_VisibleVar_Ids(Machine(Game)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Game)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Game)) == (Type(PLAYER) == Cst(SetOf(atype(PLAYER,"[PLAYER","]PLAYER"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Game)) == (Type(player) == Mvl(atype(PLAYER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Game)) == (Type(get_player) == Cst(atype(PLAYER,?,?),No_type));
  Observers(Machine(Game)) == (Type(get_player) == Cst(atype(PLAYER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
