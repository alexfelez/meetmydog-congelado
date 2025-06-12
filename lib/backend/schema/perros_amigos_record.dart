import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Listado de union de id de usuarios con los id de los perros que tiene
/// agregados como amigos
class PerrosAmigosRecord extends FirestoreRecord {
  PerrosAmigosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario_id" field.
  DocumentReference? _usuarioId;
  DocumentReference? get usuarioId => _usuarioId;
  bool hasUsuarioId() => _usuarioId != null;

  // "perro_id" field.
  DocumentReference? _perroId;
  DocumentReference? get perroId => _perroId;
  bool hasPerroId() => _perroId != null;

  // "fecha_agregado" field.
  DateTime? _fechaAgregado;
  DateTime? get fechaAgregado => _fechaAgregado;
  bool hasFechaAgregado() => _fechaAgregado != null;

  void _initializeFields() {
    _usuarioId = snapshotData['usuario_id'] as DocumentReference?;
    _perroId = snapshotData['perro_id'] as DocumentReference?;
    _fechaAgregado = snapshotData['fecha_agregado'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('perros_amigos');

  static Stream<PerrosAmigosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PerrosAmigosRecord.fromSnapshot(s));

  static Future<PerrosAmigosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PerrosAmigosRecord.fromSnapshot(s));

  static PerrosAmigosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PerrosAmigosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerrosAmigosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerrosAmigosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerrosAmigosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerrosAmigosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerrosAmigosRecordData({
  DocumentReference? usuarioId,
  DocumentReference? perroId,
  DateTime? fechaAgregado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario_id': usuarioId,
      'perro_id': perroId,
      'fecha_agregado': fechaAgregado,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerrosAmigosRecordDocumentEquality
    implements Equality<PerrosAmigosRecord> {
  const PerrosAmigosRecordDocumentEquality();

  @override
  bool equals(PerrosAmigosRecord? e1, PerrosAmigosRecord? e2) {
    return e1?.usuarioId == e2?.usuarioId &&
        e1?.perroId == e2?.perroId &&
        e1?.fechaAgregado == e2?.fechaAgregado;
  }

  @override
  int hash(PerrosAmigosRecord? e) =>
      const ListEquality().hash([e?.usuarioId, e?.perroId, e?.fechaAgregado]);

  @override
  bool isValidKey(Object? o) => o is PerrosAmigosRecord;
}
