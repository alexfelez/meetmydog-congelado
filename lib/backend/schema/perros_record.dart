import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerrosRecord extends FirestoreRecord {
  PerrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "propietario" field.
  DocumentReference? _propietario;
  DocumentReference? get propietario => _propietario;
  bool hasPropietario() => _propietario != null;

  // "raza" field.
  String? _raza;
  String get raza => _raza ?? '';
  bool hasRaza() => _raza != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  bool hasEdad() => _edad != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "caracter" field.
  String? _caracter;
  String get caracter => _caracter ?? '';
  bool hasCaracter() => _caracter != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "fecha_nacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _propietario = snapshotData['propietario'] as DocumentReference?;
    _raza = snapshotData['raza'] as String?;
    _sexo = snapshotData['sexo'] as String?;
    _color = snapshotData['color'] as String?;
    _edad = castToType<int>(snapshotData['edad']);
    _peso = castToType<double>(snapshotData['peso']);
    _caracter = snapshotData['caracter'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fechaNacimiento = snapshotData['fecha_nacimiento'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Perros');

  static Stream<PerrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PerrosRecord.fromSnapshot(s));

  static Future<PerrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PerrosRecord.fromSnapshot(s));

  static PerrosRecord fromSnapshot(DocumentSnapshot snapshot) => PerrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerrosRecordData({
  String? nombre,
  DocumentReference? propietario,
  String? raza,
  String? sexo,
  String? color,
  int? edad,
  double? peso,
  String? caracter,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? email,
  String? displayName,
  String? phoneNumber,
  DateTime? fechaNacimiento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'propietario': propietario,
      'raza': raza,
      'sexo': sexo,
      'color': color,
      'edad': edad,
      'peso': peso,
      'caracter': caracter,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'fecha_nacimiento': fechaNacimiento,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerrosRecordDocumentEquality implements Equality<PerrosRecord> {
  const PerrosRecordDocumentEquality();

  @override
  bool equals(PerrosRecord? e1, PerrosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.propietario == e2?.propietario &&
        e1?.raza == e2?.raza &&
        e1?.sexo == e2?.sexo &&
        e1?.color == e2?.color &&
        e1?.edad == e2?.edad &&
        e1?.peso == e2?.peso &&
        e1?.caracter == e2?.caracter &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fechaNacimiento == e2?.fechaNacimiento;
  }

  @override
  int hash(PerrosRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.propietario,
        e?.raza,
        e?.sexo,
        e?.color,
        e?.edad,
        e?.peso,
        e?.caracter,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.email,
        e?.displayName,
        e?.phoneNumber,
        e?.fechaNacimiento
      ]);

  @override
  bool isValidKey(Object? o) => o is PerrosRecord;
}
