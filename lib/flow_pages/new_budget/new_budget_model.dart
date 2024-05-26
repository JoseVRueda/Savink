import '/flutter_flow/flutter_flow_util.dart';
import 'new_budget_widget.dart' show NewBudgetWidget;
import 'package:flutter/material.dart';

class NewBudgetModel extends FlutterFlowModel<NewBudgetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  String? _categoryTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es requerido';
    }

    return null;
  }

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
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
    categoryTextControllerValidator = _categoryTextControllerValidator;
    amountTextControllerValidator = _amountTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    categoryFocusNode?.dispose();
    categoryTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
