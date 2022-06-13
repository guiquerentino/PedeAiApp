import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'produtos_record.g.dart';

abstract class ProdutosRecord
    implements Built<ProdutosRecord, ProdutosRecordBuilder> {
  static Serializer<ProdutosRecord> get serializer =>
      _$produtosRecordSerializer;

  @nullable
  String get nomeProduto;

  @nullable
  double get precoProduto;

  @nullable
  String get descricaoProduto;

  @nullable
  @BuiltValueField(wireName: 'IdLoja')
  String get idLoja;

  @nullable
  String get fotoProduto;

  @nullable
  bool get estaSelecionado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProdutosRecordBuilder builder) => builder
    ..nomeProduto = ''
    ..precoProduto = 0.0
    ..descricaoProduto = ''
    ..idLoja = ''
    ..fotoProduto = ''
    ..estaSelecionado = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produtos');

  static Stream<ProdutosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProdutosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProdutosRecord._();
  factory ProdutosRecord([void Function(ProdutosRecordBuilder) updates]) =
      _$ProdutosRecord;

  static ProdutosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProdutosRecordData({
  String nomeProduto,
  double precoProduto,
  String descricaoProduto,
  String idLoja,
  String fotoProduto,
  bool estaSelecionado,
}) =>
    serializers.toFirestore(
        ProdutosRecord.serializer,
        ProdutosRecord((p) => p
          ..nomeProduto = nomeProduto
          ..precoProduto = precoProduto
          ..descricaoProduto = descricaoProduto
          ..idLoja = idLoja
          ..fotoProduto = fotoProduto
          ..estaSelecionado = estaSelecionado));
