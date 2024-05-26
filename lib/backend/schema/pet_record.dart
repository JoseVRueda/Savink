import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetRecord extends FirestoreRecord {
  PetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "hearts" field.
  int? _hearts;
  int get hearts => _hearts ?? 0;
  bool hasHearts() => _hearts != null;

  // "progression" field.
  double? _progression;
  double get progression => _progression ?? 0.0;
  bool hasProgression() => _progression != null;

  // "coins" field.
  int? _coins;
  int get coins => _coins ?? 0;
  bool hasCoins() => _coins != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _hearts = castToType<int>(snapshotData['hearts']);
    _progression = castToType<double>(snapshotData['progression']);
    _coins = castToType<int>(snapshotData['coins']);
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pet');

  static Stream<PetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetRecord.fromSnapshot(s));

  static Future<PetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetRecord.fromSnapshot(s));

  static PetRecord fromSnapshot(DocumentSnapshot snapshot) => PetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetRecordData({
  int? hearts,
  double? progression,
  int? coins,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hearts': hearts,
      'progression': progression,
      'coins': coins,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetRecordDocumentEquality implements Equality<PetRecord> {
  const PetRecordDocumentEquality();

  @override
  bool equals(PetRecord? e1, PetRecord? e2) {
    return e1?.hearts == e2?.hearts &&
        e1?.progression == e2?.progression &&
        e1?.coins == e2?.coins &&
        e1?.email == e2?.email;
  }

  @override
  int hash(PetRecord? e) => const ListEquality()
      .hash([e?.hearts, e?.progression, e?.coins, e?.email]);

  @override
  bool isValidKey(Object? o) => o is PetRecord;
}
