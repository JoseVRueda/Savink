import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'budget_page_widget.dart' show BudgetPageWidget;
import 'package:flutter/material.dart';

class BudgetPageModel extends FlutterFlowModel<BudgetPageWidget> {
  ///  Local state fields for this page.

  List<BudgetRecord> tempList = [];
  void addToTempList(BudgetRecord item) => tempList.add(item);
  void removeFromTempList(BudgetRecord item) => tempList.remove(item);
  void removeAtIndexFromTempList(int index) => tempList.removeAt(index);
  void insertAtIndexInTempList(int index, BudgetRecord item) =>
      tempList.insert(index, item);
  void updateTempListAtIndex(int index, Function(BudgetRecord) updateFn) =>
      tempList[index] = updateFn(tempList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in BudgetPage widget.
  List<BudgetRecord>? query;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;

  @override
  void initState(BuildContext context) {
    emptyListModel = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyListModel.dispose();
  }
}
