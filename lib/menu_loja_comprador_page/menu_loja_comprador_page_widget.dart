import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../detalhes_produto_page/detalhes_produto_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class MenuLojaCompradorPageWidget extends StatefulWidget {
  const MenuLojaCompradorPageWidget({
    Key key,
    this.itemLoja,
  }) : super(key: key);

  final LojasRecord itemLoja;

  @override
  _MenuLojaCompradorPageWidgetState createState() =>
      _MenuLojaCompradorPageWidgetState();
}

class _MenuLojaCompradorPageWidgetState
    extends State<MenuLojaCompradorPageWidget> {
  List<ProdutosRecord> simpleSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
        List<SubprodutosRecord> menuLojaCompradorPageSubprodutosRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              fillColor: Colors.white,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                    reverseDuration: Duration(milliseconds: 0),
                    child: NavBarPage(initialPage: 'TelaPrincipal'),
                  ),
                );
              },
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.itemLoja.nomeLoja,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF1F4F8),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.03,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.2, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xFFF1F4F8),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-0.25, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          controller: textController,
                                          onFieldSubmitted: (_) async {
                                            await queryProdutosRecordOnce()
                                                .then(
                                                  (records) =>
                                                      simpleSearchResults =
                                                          TextSearch(
                                                    records
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record, [
                                                            record.nomeProduto
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                              .search(
                                                                  textController
                                                                      .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .toList(),
                                                )
                                                .onError((_, __) =>
                                                    simpleSearchResults = [])
                                                .whenComplete(
                                                    () => setState(() {}));

                                            setState(() => FFAppState()
                                                    .mostrarListaCompletaMenuLoja =
                                                false);
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Procure pelo nome de produtos..',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            suffixIcon: Icon(
                                              Icons.search,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
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
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 12, 0, 12),
                          child: Text(
                            'Recomendado para você',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (FFAppState().mostrarListaCompletaMenuLoja ?? true)
                  StreamBuilder<List<ProdutosRecord>>(
                    stream: queryProdutosRecord(
                      queryBuilder: (produtosRecord) => produtosRecord
                          .where('IdLoja', isEqualTo: widget.itemLoja.idLoja),
                    ),
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
                      List<ProdutosRecord> wrapProdutosRecordList =
                          snapshot.data;
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(wrapProdutosRecordList.length,
                            (wrapIndex) {
                          final wrapProdutosRecord =
                              wrapProdutosRecordList[wrapIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: DetalhesProdutoPageWidget(
                                    detalhesProduto: wrapProdutosRecord,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x3600000F),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                            child: Image.network(
                                              wrapProdutosRecord.fotoProduto,
                                              width: 100,
                                              height: 110,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              wrapProdutosRecord.nomeProduto,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              formatNumber(
                                                wrapProdutosRecord.precoProduto,
                                                formatType: FormatType.custom,
                                                currency: 'R\$',
                                                format: '.###',
                                                locale: 'pt_BR',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 5, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if ((wrapProdutosRecord
                                                        .estaSelecionado) ==
                                                    true) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Produto já adicionado ao carrinho.',
                                                        style: TextStyle(),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark900,
                                                    ),
                                                  );
                                                } else {
                                                  if ((menuLojaCompradorPageSubprodutosRecordList
                                                          .length) ==
                                                      0) {
                                                    setState(() => FFAppState()
                                                            .lojaQueEstaNoCarrinho =
                                                        wrapProdutosRecord
                                                            .idLoja);
                                                    setState(() => FFAppState()
                                                            .lojaVendedoraCarrinhoNome =
                                                        widget
                                                            .itemLoja.nomeLoja);
                                                    setState(() => FFAppState()
                                                            .fotoLojaVendedoraCarrinho =
                                                        widget
                                                            .itemLoja.fotoLoja);
                                                  } else {
                                                    if ((widget
                                                            .itemLoja.idLoja) !=
                                                        (FFAppState()
                                                            .lojaQueEstaNoCarrinho)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Só é possível adicionar produtos de uma loja por vez!',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .dark900,
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                  }

                                                  final subprodutosCreateData =
                                                      createSubprodutosRecordData(
                                                    produto: wrapProdutosRecord
                                                        .reference,
                                                    quantidade: 1,
                                                    subtotal: wrapProdutosRecord
                                                        .precoProduto,
                                                    lojaVendedora: widget
                                                        .itemLoja.nomeLoja,
                                                    idComprador: valueOrDefault(
                                                        currentUserDocument
                                                            ?.idCliente,
                                                        ''),
                                                  );
                                                  await SubprodutosRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          subprodutosCreateData);

                                                  final produtosUpdateData =
                                                      createProdutosRecordData(
                                                    estaSelecionado: true,
                                                  );
                                                  await wrapProdutosRecord
                                                      .reference
                                                      .update(
                                                          produtosUpdateData);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Produto adicionado ao carrinho',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 1500),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark900,
                                                    ),
                                                  );
                                                }
                                              },
                                              text: '+',
                                              options: FFButtonOptions(
                                                width: 50,
                                                height: 18,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black600,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                if (!(FFAppState().mostrarListaCompletaMenuLoja) ?? true)
                  Builder(
                    builder: (context) {
                      final produtoLoja = simpleSearchResults?.toList() ?? [];
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(produtoLoja.length,
                            (produtoLojaIndex) {
                          final produtoLojaItem = produtoLoja[produtoLojaIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: DetalhesProdutoPageWidget(
                                    detalhesProduto: produtoLojaItem,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x3600000F),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                              width: 100,
                                              height: 110,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              produtoLojaItem.nomeProduto,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              formatNumber(
                                                produtoLojaItem.precoProduto,
                                                formatType: FormatType.custom,
                                                currency: 'R\$',
                                                format: '.###',
                                                locale: 'pt_BR',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 5, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: '+',
                                              options: FFButtonOptions(
                                                width: 50,
                                                height: 18,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black600,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
