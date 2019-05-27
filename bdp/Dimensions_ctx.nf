Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Dimensions_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Dimensions_ctx))==(Machine(Dimensions_ctx));
  Level(Machine(Dimensions_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Dimensions_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Dimensions_ctx))==(?);
  List_Includes(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Dimensions_ctx))==(?);
  Context_List_Variables(Machine(Dimensions_ctx))==(?);
  Abstract_List_Variables(Machine(Dimensions_ctx))==(?);
  Local_List_Variables(Machine(Dimensions_ctx))==(?);
  List_Variables(Machine(Dimensions_ctx))==(?);
  External_List_Variables(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Dimensions_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(Dimensions_ctx))==(?);
  External_List_VisibleVariables(Machine(Dimensions_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(Dimensions_ctx))==(?);
  List_VisibleVariables(Machine(Dimensions_ctx))==(?);
  Internal_List_VisibleVariables(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Dimensions_ctx))==(btrue);
  Gluing_List_Invariant(Machine(Dimensions_ctx))==(btrue);
  Expanded_List_Invariant(Machine(Dimensions_ctx))==(btrue);
  Abstract_List_Invariant(Machine(Dimensions_ctx))==(btrue);
  Context_List_Invariant(Machine(Dimensions_ctx))==(btrue);
  List_Invariant(Machine(Dimensions_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Dimensions_ctx))==(btrue);
  Abstract_List_Assertions(Machine(Dimensions_ctx))==(btrue);
  Context_List_Assertions(Machine(Dimensions_ctx))==(btrue);
  List_Assertions(Machine(Dimensions_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Dimensions_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Dimensions_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Dimensions_ctx))==(skip);
  Context_List_Initialisation(Machine(Dimensions_ctx))==(skip);
  List_Initialisation(Machine(Dimensions_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Dimensions_ctx))==(btrue);
  List_Constraints(Machine(Dimensions_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Dimensions_ctx))==(?);
  List_Operations(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Dimensions_ctx))==(dim_x,dim_y,sz);
  Inherited_List_Constants(Machine(Dimensions_ctx))==(?);
  List_Constants(Machine(Dimensions_ctx))==(dim_x,dim_y,sz)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Dimensions_ctx))==(?);
  Context_List_Defered(Machine(Dimensions_ctx))==(?);
  Context_List_Sets(Machine(Dimensions_ctx))==(?);
  List_Valuable_Sets(Machine(Dimensions_ctx))==(?);
  Inherited_List_Enumerated(Machine(Dimensions_ctx))==(?);
  Inherited_List_Defered(Machine(Dimensions_ctx))==(?);
  Inherited_List_Sets(Machine(Dimensions_ctx))==(?);
  List_Enumerated(Machine(Dimensions_ctx))==(?);
  List_Defered(Machine(Dimensions_ctx))==(?);
  List_Sets(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Dimensions_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(Dimensions_ctx))==(?);
  List_HiddenConstants(Machine(Dimensions_ctx))==(?);
  External_List_HiddenConstants(Machine(Dimensions_ctx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Dimensions_ctx))==(btrue);
  Context_List_Properties(Machine(Dimensions_ctx))==(btrue);
  Inherited_List_Properties(Machine(Dimensions_ctx))==(btrue);
  List_Properties(Machine(Dimensions_ctx))==(dim_x: NAT & dim_y: NAT & sz: NAT)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Dimensions_ctx)) == (dim_x,dim_y,sz | ? | ? | ? | ? | ? | ? | ? | Dimensions_ctx);
  List_Of_HiddenCst_Ids(Machine(Dimensions_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Dimensions_ctx)) == (dim_x,dim_y,sz);
  List_Of_VisibleVar_Ids(Machine(Dimensions_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Dimensions_ctx)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Dimensions_ctx)) == (Type(dim_x) == Cst(btype(INTEGER,?,?));Type(dim_y) == Cst(btype(INTEGER,?,?));Type(sz) == Cst(btype(INTEGER,?,?)))
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
