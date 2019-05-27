Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Ship))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Ship))==(Machine(Ship));
  Level(Machine(Ship))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Ship)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Ship))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Ship))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Ship))==(?);
  List_Includes(Machine(Ship))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ship))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Ship))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Ship))==(?);
  Context_List_Variables(Machine(Ship))==(?);
  Abstract_List_Variables(Machine(Ship))==(?);
  Local_List_Variables(Machine(Ship))==(ship_size);
  List_Variables(Machine(Ship))==(ship_size);
  External_List_Variables(Machine(Ship))==(ship_size)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Ship))==(?);
  Abstract_List_VisibleVariables(Machine(Ship))==(?);
  External_List_VisibleVariables(Machine(Ship))==(?);
  Expanded_List_VisibleVariables(Machine(Ship))==(?);
  List_VisibleVariables(Machine(Ship))==(?);
  Internal_List_VisibleVariables(Machine(Ship))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Ship))==(btrue);
  Gluing_List_Invariant(Machine(Ship))==(btrue);
  Expanded_List_Invariant(Machine(Ship))==(btrue);
  Abstract_List_Invariant(Machine(Ship))==(btrue);
  Context_List_Invariant(Machine(Ship))==(btrue);
  List_Invariant(Machine(Ship))==(ship_size: SHIP_TYPE --> 1..4)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Ship))==(btrue);
  Abstract_List_Assertions(Machine(Ship))==(btrue);
  Context_List_Assertions(Machine(Ship))==(btrue);
  List_Assertions(Machine(Ship))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Ship))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Ship))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Ship))==(@(ship_size$0).(ship_size$0: SHIP_TYPE --> 1..4 ==> ship_size:=ship_size$0));
  Context_List_Initialisation(Machine(Ship))==(skip);
  List_Initialisation(Machine(Ship))==(ship_size:: SHIP_TYPE --> 1..4)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ship))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Ship))==(btrue);
  List_Constraints(Machine(Ship))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ship))==(get_ship_size);
  List_Operations(Machine(Ship))==(get_ship_size)
END
&
THEORY ListInputX IS
  List_Input(Machine(Ship),get_ship_size)==(ss)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Ship),get_ship_size)==(rr)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Ship),get_ship_size)==(rr <-- get_ship_size(ss))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Ship),get_ship_size)==(ss: SHIP_TYPE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Ship),get_ship_size)==(ss: SHIP_TYPE | rr:=ship_size(ss));
  List_Substitution(Machine(Ship),get_ship_size)==(rr:=ship_size(ss))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Ship))==(?);
  Inherited_List_Constants(Machine(Ship))==(?);
  List_Constants(Machine(Ship))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Ship),SHIP_TYPE)==(?);
  Context_List_Enumerated(Machine(Ship))==(?);
  Context_List_Defered(Machine(Ship))==(?);
  Context_List_Sets(Machine(Ship))==(?);
  List_Valuable_Sets(Machine(Ship))==(SHIP_TYPE);
  Inherited_List_Enumerated(Machine(Ship))==(?);
  Inherited_List_Defered(Machine(Ship))==(?);
  Inherited_List_Sets(Machine(Ship))==(?);
  List_Enumerated(Machine(Ship))==(?);
  List_Defered(Machine(Ship))==(SHIP_TYPE);
  List_Sets(Machine(Ship))==(SHIP_TYPE)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Ship))==(?);
  Expanded_List_HiddenConstants(Machine(Ship))==(?);
  List_HiddenConstants(Machine(Ship))==(?);
  External_List_HiddenConstants(Machine(Ship))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Ship))==(btrue);
  Context_List_Properties(Machine(Ship))==(btrue);
  Inherited_List_Properties(Machine(Ship))==(btrue);
  List_Properties(Machine(Ship))==(SHIP_TYPE: FIN(INTEGER) & not(SHIP_TYPE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Ship),get_ship_size)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ship)) == (SHIP_TYPE | ? | ship_size | ? | get_ship_size | ? | ? | ? | Ship);
  List_Of_HiddenCst_Ids(Machine(Ship)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ship)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ship)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ship)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Ship)) == (Type(SHIP_TYPE) == Cst(SetOf(atype(SHIP_TYPE,"[SHIP_TYPE","]SHIP_TYPE"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Ship)) == (Type(ship_size) == Mvl(SetOf(atype(SHIP_TYPE,"[SHIP_TYPE","]SHIP_TYPE")*btype(INTEGER,1,4))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Ship)) == (Type(get_ship_size) == Cst(btype(INTEGER,?,?),atype(SHIP_TYPE,?,?)));
  Observers(Machine(Ship)) == (Type(get_ship_size) == Cst(btype(INTEGER,?,?),atype(SHIP_TYPE,?,?)))
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
