import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaseosRecord extends FirestoreRecord {
  PaseosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  bool hasHoraFin() => _horaFin != null;

  // "ubicacion" field.
  LatLng? _ubicacion;
  LatLng? get ubicacion => _ubicacion;
  bool hasUbicacion() => _ubicacion != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "perros" field.
  List<DocumentReference>? _perros;
  List<DocumentReference> get perros => _perros ?? const [];
  bool hasPerros() => _perros != null;

  // "perros_participantes_nombre" field.
  List<String>? _perrosParticipantesNombre;
  List<String> get perrosParticipantesNombre =>
      _perrosParticipantesNombre ?? const [];
  bool hasPerrosParticipantesNombre() => _perrosParticipantesNombre != null;

  // "Detalles" field.
  String? _detalles;
  String get detalles => _detalles ?? '';
  bool hasDetalles() => _detalles != null;

  void _initializeFields() {
    _horaInicio = snapshotData['horaInicio'] as DateTime?;
    _horaFin = snapshotData['horaFin'] as DateTime?;
    _ubicacion = snapshotData['ubicacion'] as LatLng?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _perros = getDataList(snapshotData['perros']);
    _perrosParticipantesNombre =
        getDataList(snapshotData['perros_participantes_nombre']);
    _detalles = snapshotData['Detalles'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paseos');

  static Stream<PaseosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaseosRecord.fromSnapshot(s));

  static Future<PaseosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaseosRecord.fromSnapshot(s));

  static PaseosRecord fromSnapshot(DocumentSnapshot snapshot) => PaseosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaseosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaseosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaseosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaseosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaseosRecordData({
  DateTime? horaInicio,
  DateTime? horaFin,
  LatLng? ubicacion,
  DocumentReference? createdBy,
  DateTime? fecha,
  String? uid,
  DateTime? createdTime,
  String? detalles,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'ubicacion': ubicacion,
      'createdBy': createdBy,
      'fecha': fecha,
      'uid': uid,
      'created_time': createdTime,
      'Detalles': detalles,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaseosRecordDocumentEquality implements Equality<PaseosRecord> {
  const PaseosRecordDocumentEquality();

  @override
  bool equals(PaseosRecord? e1, PaseosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin &&
        e1?.ubicacion == e2?.ubicacion &&
        e1?.createdBy == e2?.createdBy &&
        e1?.fecha == e2?.fecha &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.perros, e2?.perros) &&
        listEquality.equals(
            e1?.perrosParticipantesNombre, e2?.perrosParticipantesNombre) &&
        e1?.detalles == e2?.detalles;
  }

  @override
  int hash(PaseosRecord? e) => const ListEquality().hash([
        e?.horaInicio,
        e?.horaFin,
        e?.ubicacion,
        e?.createdBy,
        e?.fecha,
        e?.uid,
        e?.createdTime,
        e?.perros,
        e?.perrosParticipantesNombre,
        e?.detalles
      ]);

  @override
  bool isValidKey(Object? o) => o is PaseosRecord;
}
