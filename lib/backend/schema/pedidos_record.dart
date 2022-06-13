import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pedidos_record.g.dart';

abstract class PedidosRecord
    implements Built<PedidosRecord, PedidosRecordBuilder> {
  static Serializer<PedidosRecord> get serializer => _$pedidosRecordSerializer;

  @nullable
  String get nomeLojaVendedora;

  @nullable
  double get subtotalPedido;

  @nullable
  BuiltList<DocumentReference> get listaProdutosPedido;

  @nullable
  String get fotoLojaVendedora;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PedidosRecordBuilder builder) => builder
    ..nomeLojaVendedora = ''
    ..subtotalPedido = 0.0
    ..listaProdutosPedido = ListBuilder()
    ..fotoLojaVendedora = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PedidosRecord._();
  factory PedidosRecord([void Function(PedidosRecordBuilder) updates]) =
      _$PedidosRecord;

  static PedidosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPedidosRecordData({
  String nomeLojaVendedora,
  double subtotalPedido,
  String fotoLojaVendedora,
}) =>
    serializers.toFirestore(
        PedidosRecord.serializer,
        PedidosRecord((p) => p
          ..nomeLojaVendedora = nomeLojaVendedora
          ..subtotalPedido = subtotalPedido
          ..listaProdutosPedido = null
          ..fotoLojaVendedora = fotoLojaVendedora));
