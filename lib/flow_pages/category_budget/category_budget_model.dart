import '/flutter_flow/flutter_flow_util.dart';
import 'category_budget_widget.dart' show CategoryBudgetWidget;
import 'package:flutter/material.dart';

class CategoryBudgetModel extends FlutterFlowModel<CategoryBudgetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
