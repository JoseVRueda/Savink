import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetRecord extends FirestoreRecord {
  BudgetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  bool hasDeadline() => _deadline != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "payed_amount" field.
  double? _payedAmount;
  double get payedAmount => _payedAmount ?? 0.0;
  bool hasPayedAmount() => _payedAmount != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _deadline = snapshotData['deadline'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _payedAmount = castToType<double>(snapshotData['payed_amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budget');

  static Stream<BudgetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetRecord.fromSnapshot(s));

  static Future<BudgetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetRecord.fromSnapshot(s));

  static BudgetRecord fromSnapshot(DocumentSnapshot snapshot) => BudgetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetRecordData({
  String? category,
  String? name,
  double? amount,
  DateTime? deadline,
  String? email,
  double? payedAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'name': name,
      'amount': amount,
      'deadline': deadline,
      'email': email,
      'payed_amount': payedAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetRecordDocumentEquality implements Equality<BudgetRecord> {
  const BudgetRecordDocumentEquality();

  @override
  bool equals(BudgetRecord? e1, BudgetRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.deadline == e2?.deadline &&
        e1?.email == e2?.email &&
        e1?.payedAmount == e2?.payedAmount;
  }

  @override
  int hash(BudgetRecord? e) => const ListEquality().hash(
      [e?.category, e?.name, e?.amount, e?.deadline, e?.email, e?.payedAmount]);

  @override
  bool isValidKey(Object? o) => o is BudgetRecord;
}
