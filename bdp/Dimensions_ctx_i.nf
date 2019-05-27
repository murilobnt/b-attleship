Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Dimensions_ctx_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Dimensions_ctx_i))==(Machine(Dimensions_ctx));
  Level(Implementation(Dimensions_ctx_i))==(1);
  Upper_Level(Implementation(Dimensions_ctx_i))==(Machine(Dimensions_ctx))
END
&
THEORY LoadedStructureX IS
  Implementation(Dimensions_ctx_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Dimensions_ctx_i))==(?);
  Inherited_List_Includes(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Dimensions_ctx_i))==(?);
  Context_List_Variables(Implementation(Dimensions_ctx_i))==(?);
  Abstract_List_Variables(Implementation(Dimensions_ctx_i))==(?);
  Local_List_Variables(Implementation(Dimensions_ctx_i))==(?);
  List_Variables(Implementation(Dimensions_ctx_i))==(?);
  External_List_Variables(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?);
  External_List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?);
  List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?);
  Internal_List_VisibleVariables(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Dimensions_ctx_i))==(btrue);
  Expanded_List_Invariant(Implementation(Dimensions_ctx_i))==(btrue);
  Abstract_List_Invariant(Implementation(Dimensions_ctx_i))==(btrue);
  Context_List_Invariant(Implementation(Dimensions_ctx_i))==(btrue);
  List_Invariant(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Dimensions_ctx_i))==(btrue);
  Abstract_List_Assertions(Implementation(Dimensions_ctx_i))==(btrue);
  Context_List_Assertions(Implementation(Dimensions_ctx_i))==(btrue);
  List_Assertions(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Dimensions_ctx_i))==(skip);
  Context_List_Initialisation(Implementation(Dimensions_ctx_i))==(skip);
  List_Initialisation(Implementation(Dimensions_ctx_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Dimensions_ctx_i))==(btrue);
  List_Context_Constraints(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Dimensions_ctx_i))==(?);
  List_Operations(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Dimensions_ctx_i))==(dim_x,dim_y,sz);
  Inherited_List_Constants(Implementation(Dimensions_ctx_i))==(dim_x,dim_y,sz);
  List_Constants(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Dimensions_ctx_i))==(?);
  Context_List_Defered(Implementation(Dimensions_ctx_i))==(?);
  Context_List_Sets(Implementation(Dimensions_ctx_i))==(?);
  List_Own_Enumerated(Implementation(Dimensions_ctx_i))==(?);
  List_Valuable_Sets(Implementation(Dimensions_ctx_i))==(?);
  Inherited_List_Enumerated(Implementation(Dimensions_ctx_i))==(?);
  Inherited_List_Defered(Implementation(Dimensions_ctx_i))==(?);
  Inherited_List_Sets(Implementation(Dimensions_ctx_i))==(?);
  List_Enumerated(Implementation(Dimensions_ctx_i))==(?);
  List_Defered(Implementation(Dimensions_ctx_i))==(?);
  List_Sets(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Dimensions_ctx_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Dimensions_ctx_i))==(?);
  List_HiddenConstants(Implementation(Dimensions_ctx_i))==(?);
  External_List_HiddenConstants(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Dimensions_ctx_i))==(dim_x: NAT & dim_y: NAT & sz: NAT);
  Context_List_Properties(Implementation(Dimensions_ctx_i))==(btrue);
  Inherited_List_Properties(Implementation(Dimensions_ctx_i))==(btrue);
  List_Properties(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(Dimensions_ctx_i))==(10*10: INT & 10: INT);
  Values_Subs(Implementation(Dimensions_ctx_i))==(dim_x,dim_y,sz: 10,10,10*10);
  List_Values(Implementation(Dimensions_ctx_i))==(dim_x = 10;dim_y = 10;sz = 10*10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Constants(Implementation(Dimensions_ctx_i))==(Type(dim_x) == Cst(btype(INTEGER,?,?));Type(dim_y) == Cst(btype(INTEGER,?,?));Type(sz) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Dimensions_ctx_i)) == (? | ? | ? | ? | ? | ? | ? | ? | Dimensions_ctx_i);
  List_Of_HiddenCst_Ids(Implementation(Dimensions_ctx_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Dimensions_ctx_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Dimensions_ctx_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Dimensions_ctx_i)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(Dimensions_ctx_i)) == (Type(sz) == Cst(btype(INTEGER,?,?));Type(dim_y) == Cst(btype(INTEGER,?,?));Type(dim_x) == Cst(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Dimensions_ctx_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Dimensions_ctx_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
