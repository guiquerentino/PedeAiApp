import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forma_de_pagamento_page/forma_de_pagamento_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({Key key}) : super(key: key);

  @override
  _CarrinhoWidgetState createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SubprodutosRecord>>(
      stream: querySubprodutosRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
        List<SubprodutosRecord> carrinhoSubprodutosRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Carrinho',
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x4814181B),
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Text(
                                  functions.valorTotalCarrinhoString(
                                      carrinhoSubprodutosRecordList
                                          .map((e) => e.subtotal)
                                          .toList()),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if ((carrinhoSubprodutosRecordList.length) <= 0)
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Image.asset(
                              'assets/images/Carrinho_Vazio-removebg-preview.png',
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.5,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if ((carrinhoSubprodutosRecordList.length) <= 0)
                          Align(
                            alignment: AlignmentDirectional(0.15, -0.1),
                            child: Text(
                              'Carrinho Vazio! :(',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).dark900,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        if ((carrinhoSubprodutosRecordList.length) >= 1)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if ((carrinhoSubprodutosRecordList.length) >= 1)
                                  Expanded(
                                    child: AuthUserStreamWidget(
                                      child: StreamBuilder<
                                          List<SubprodutosRecord>>(
                                        stream: querySubprodutosRecord(
                                          queryBuilder: (subprodutosRecord) =>
                                              subprodutosRecord.where(
                                                  'idComprador',
                                                  isEqualTo: valueOrDefault(
                                                      currentUserDocument
                                                          ?.idCliente,
                                                      '')),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }
                                          List<SubprodutosRecord>
                                              listViewSubprodutosRecordList =
                                              snapshot.data;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewSubprodutosRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewSubprodutosRecord =
                                                  listViewSubprodutosRecordList[
                                                      listViewIndex];
                                              return StreamBuilder<
                                                  ProdutosRecord>(
                                                stream:
                                                    ProdutosRecord.getDocument(
                                                        listViewSubprodutosRecord
                                                            .produto),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final productContainerProdutosRecord =
                                                      snapshot.data;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.96,
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x3A000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child: Image
                                                                    .network(
                                                                  productContainerProdutosRecord
                                                                      .fotoProduto,
                                                                  width: 74,
                                                                  height: 74,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  productContainerProdutosRecord
                                                                      .nomeProduto,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          16,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      if ((listViewSubprodutosRecord
                                                                              .quantidade) >=
                                                                          2)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            final subprodutosUpdateData =
                                                                                {
                                                                              ...createSubprodutosRecordData(
                                                                                subtotal: functions.diminuirSubtotal(listViewSubprodutosRecord.subtotal, productContainerProdutosRecord.precoProduto),
                                                                              ),
                                                                              'quantidade': FieldValue.increment(-1),
                                                                            };
                                                                            await listViewSubprodutosRecord.reference.update(subprodutosUpdateData);
                                                                          },
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.minus,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                      if ((listViewSubprodutosRecord
                                                                              .quantidade) <=
                                                                          1)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await listViewSubprodutosRecord.reference.delete();

                                                                            final produtosUpdateData =
                                                                                createProdutosRecordData(
                                                                              estaSelecionado: false,
                                                                            );
                                                                            await productContainerProdutosRecord.reference.update(produtosUpdateData);
                                                                          },
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.trash,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                      Text(
                                                                        listViewSubprodutosRecord
                                                                            .quantidade
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              fontSize: 20,
                                                                            ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          final subprodutosUpdateData =
                                                                              {
                                                                            ...createSubprodutosRecordData(
                                                                              subtotal: functions.somarSubtotal(listViewSubprodutosRecord.subtotal, productContainerProdutosRecord.precoProduto),
                                                                            ),
                                                                            'quantidade':
                                                                                FieldValue.increment(1),
                                                                          };
                                                                          await listViewSubprodutosRecord
                                                                              .reference
                                                                              .update(subprodutosUpdateData);
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .plus,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        functions.retornaValorTotal(
                                                                            listViewSubprodutosRecord.quantidade,
                                                                            productContainerProdutosRecord.precoProduto),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF090F13),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        if ((carrinhoSubprodutosRecordList.length) >= 1)
                          Divider(
                            height: 2,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                            color: Colors.transparent,
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x3A000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Visibility(
                                visible:
                                    (carrinhoSubprodutosRecordList.length) >= 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Resumo',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF090F13),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF95A1AC),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            functions.valorTotalCarrinhoString(
                                                carrinhoSubprodutosRecordList
                                                    .map((e) => e.subtotal)
                                                    .toList()),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF090F13),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF95A1AC),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            functions.valorTotalCarrinhoString(
                                                carrinhoSubprodutosRecordList
                                                    .map((e) => e.subtotal)
                                                    .toList()),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF090F13),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final pedidosCreateData = {
                                            ...createPedidosRecordData(
                                              nomeLojaVendedora: FFAppState()
                                                  .lojaVendedoraCarrinhoNome,
                                              subtotalPedido: functions
                                                  .valorTotalCarrinhoDouble(
                                                      carrinhoSubprodutosRecordList
                                                          .map(
                                                              (e) => e.subtotal)
                                                          .toList()),
                                              fotoLojaVendedora: FFAppState()
                                                  .fotoLojaVendedoraCarrinho,
                                              idComprador: valueOrDefault(
                                                  currentUserDocument
                                                      ?.idCliente,
                                                  ''),
                                            ),
                                            'listaProdutosPedido':
                                                carrinhoSubprodutosRecordList
                                                    .map((e) => e.reference)
                                                    .toList(),
                                          };
                                          await PedidosRecord.collection
                                              .doc()
                                              .set(pedidosCreateData);
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child:
                                                  FormaDePagamentoPageWidget(),
                                            ),
                                          );
                                        },
                                        text: 'Finalizar compra',
                                        options: FFButtonOptions(
                                          width: 180,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .black600,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
