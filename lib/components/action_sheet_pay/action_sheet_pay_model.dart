import '/flutter_flow/flutter_flow_util.dart';
import 'action_sheet_pay_widget.dart' show ActionSheetPayWidget;
import 'package:flutter/material.dart';

class ActionSheetPayModel extends FlutterFlowModel<ActionSheetPayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
