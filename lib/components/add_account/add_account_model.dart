import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_account_widget.dart' show AddAccountWidget;
import 'package:flutter/material.dart';

class AddAccountModel extends FlutterFlowModel<AddAccountWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for bank widget.
  String? bankValue;
  FormFieldController<String>? bankValueController;
  // State field(s) for accountType widget.
  String? accountTypeValue;
  FormFieldController<String>? accountTypeValueController;
  // State field(s) for accountNumber widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberTextController;
  String? Function(BuildContext, String?)? accountNumberTextControllerValidator;
  String? _accountNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es requerido';
    }

    if (val.length < 11) {
      return 'El número cuenta tiene que tener 11 caracteres';
    }
    if (val.length > 11) {
      return 'El número cuenta tiene que tener 11 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    accountNumberTextControllerValidator =
        _accountNumberTextControllerValidator;
  }

  @override
  void dispose() {
    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();
  }
}
