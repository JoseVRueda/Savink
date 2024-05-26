import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountRecord extends FirestoreRecord {
  AccountRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "account_number" field.
  double? _accountNumber;
  double get accountNumber => _accountNumber ?? 0.0;
  bool hasAccountNumber() => _accountNumber != null;

  // "account_type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  bool hasAccountType() => _accountType != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _accountNumber = castToType<double>(snapshotData['account_number']);
    _accountType = snapshotData['account_type'] as String?;
    _bank = snapshotData['bank'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('account');

  static Stream<AccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountRecord.fromSnapshot(s));

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountRecord.fromSnapshot(s));

  static AccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountRecordData({
  double? accountNumber,
  String? accountType,
  String? bank,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'account_number': accountNumber,
      'account_type': accountType,
      'bank': bank,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.accountNumber == e2?.accountNumber &&
        e1?.accountType == e2?.accountType &&
        e1?.bank == e2?.bank &&
        e1?.email == e2?.email;
  }

  @override
  int hash(AccountRecord? e) => const ListEquality()
      .hash([e?.accountNumber, e?.accountType, e?.bank, e?.email]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
