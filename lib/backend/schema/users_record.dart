import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get userRole;

  @nullable
  String get password;

  @nullable
  bool get contaVerificada;

  @nullable
  String get cpfCliente;

  @nullable
  String get enderecoCliente;

  @nullable
  String get numeroCasaCliente;

  @nullable
  @BuiltValueField(wireName: 'CepCliente')
  String get cepCliente;

  @nullable
  bool get ehPrimeiraVez;

  @nullable
  String get idCliente;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..userRole = ''
    ..password = ''
    ..contaVerificada = false
    ..cpfCliente = ''
    ..enderecoCliente = ''
    ..numeroCasaCliente = ''
    ..cepCliente = ''
    ..ehPrimeiraVez = false
    ..idCliente = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String userRole,
  String password,
  bool contaVerificada,
  String cpfCliente,
  String enderecoCliente,
  String numeroCasaCliente,
  String cepCliente,
  bool ehPrimeiraVez,
  String idCliente,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..userRole = userRole
          ..password = password
          ..contaVerificada = contaVerificada
          ..cpfCliente = cpfCliente
          ..enderecoCliente = enderecoCliente
          ..numeroCasaCliente = numeroCasaCliente
          ..cepCliente = cepCliente
          ..ehPrimeiraVez = ehPrimeiraVez
          ..idCliente = idCliente));
