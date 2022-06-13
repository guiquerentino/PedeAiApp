import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subprodutos_record.g.dart';

abstract class SubprodutosRecord
    implements Built<SubprodutosRecord, SubprodutosRecordBuilder> {
  static Serializer<SubprodutosRecord> get serializer =>
      _$subprodutosRecordSerializer;

  @nullable
  DocumentReference get produto;

  @nullable
  int get quantidade;

  @nullable
  double get subtotal;

  @nullable
  String get lojaVendedora;

  @nullable
  String get fotoLojaVendedora;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SubprodutosRecordBuilder builder) => builder
    ..quantidade = 0
    ..subtotal = 0.0
    ..lojaVendedora = ''
    ..fotoLojaVendedora = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subprodutos');

  static Stream<SubprodutosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubprodutosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubprodutosRecord._();
  factory SubprodutosRecord([void Function(SubprodutosRecordBuilder) updates]) =
      _$SubprodutosRecord;

  static SubprodutosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubprodutosRecordData({
  DocumentReference produto,
  int quantidade,
  double subtotal,
  String lojaVendedora,
  String fotoLojaVendedora,
}) =>
    serializers.toFirestore(
        SubprodutosRecord.serializer,
        SubprodutosRecord((s) => s
          ..produto = produto
          ..quantidade = quantidade
          ..subtotal = subtotal
          ..lojaVendedora = lojaVendedora
          ..fotoLojaVendedora = fotoLojaVendedora));
