import '/flutter_flow/flutter_flow_util.dart';
import 'new_category_budget_widget.dart' show NewCategoryBudgetWidget;
import 'package:flutter/material.dart';

class NewCategoryBudgetModel extends FlutterFlowModel<NewCategoryBudgetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es requerido';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
