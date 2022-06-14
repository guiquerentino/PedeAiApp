import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesProdutoPageWidget extends StatefulWidget {
  const DetalhesProdutoPageWidget({
    Key key,
    this.detalhesProduto,
  }) : super(key: key);

  final ProdutosRecord detalhesProduto;

  @override
  _DetalhesProdutoPageWidgetState createState() =>
      _DetalhesProdutoPageWidgetState();
}

class _DetalhesProdutoPageWidgetState extends State<DetalhesProdutoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int countControllerValue;

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
        List<SubprodutosRecord> detalhesProdutoPageSubprodutosRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Detalhes do Produto',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).dark900,
                        fontSize: 20,
                      ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.detalhesProduto.fotoProduto,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.detalhesProduto.nomeProduto,
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Expanded(
                              child: Text(
                                formatNumber(
                                  widget.detalhesProduto.precoProduto,
                                  formatType: FormatType.custom,
                                  currency: 'R\$',
                                  format: '.###',
                                  locale: 'pt_BR',
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF6F1E51),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Text(
                                  widget.detalhesProduto.descricaoProduto,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                            child: Container(
                              width: 160,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: enabled
                                      ? Color(0xFF95A1AC)
                                      : Color(0xFFEEEEEE),
                                  size: 28,
                                ),
                                incrementIconBuilder: (enabled) => Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: enabled
                                      ? Color(0xFF6F1E51)
                                      : Color(0xFFEEEEEE),
                                  size: 28,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                count: countControllerValue ??= 1,
                                updateCount: (count) => setState(
                                    () => countControllerValue = count),
                                stepSize: 1,
                                minimum: 1,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final subprodutosCreateData = createSubprodutosRecordData(
                    produto: widget.detalhesProduto.reference,
                    quantidade: countControllerValue,
                    subtotal: functions.somaProdutoEQuantidade(
                        countControllerValue,
                        widget.detalhesProduto.precoProduto),
                    lojaVendedora: widget.detalhesProduto.idLoja,
                  );
                  await SubprodutosRecord.collection
                      .doc()
                      .set(subprodutosCreateData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Produto adicionado ao carirnho.',
                        style: GoogleFonts.getFont(
                          'Ubuntu',
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0x00000000),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black,
                        offset: Offset(0, -2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if ((widget.detalhesProduto.estaSelecionado) == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Produto já adicionado ao carrinho.',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).dark900,
                            ),
                          );
                        } else {
                          if ((detalhesProdutoPageSubprodutosRecordList
                                  .length) ==
                              0) {
                            setState(() => FFAppState().lojaQueEstaNoCarrinho =
                                widget.detalhesProduto.idLoja);
                            setState(() =>
                                FFAppState().lojaVendedoraCarrinhoNome =
                                    widget.detalhesProduto.idLoja);
                            setState(() =>
                                FFAppState().fotoLojaVendedoraCarrinho =
                                    widget.detalhesProduto.fotoLojaVendedora);
                          } else {
                            if ((widget.detalhesProduto.idLoja) !=
                                (FFAppState().lojaQueEstaNoCarrinho)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Só é possível adicionar produtos de uma loja por vez!',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2500),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).dark900,
                                ),
                              );
                              return;
                            }
                          }

                          final subprodutosCreateData =
                              createSubprodutosRecordData(
                            produto: widget.detalhesProduto.reference,
                            quantidade: countControllerValue,
                            subtotal: widget.detalhesProduto.precoProduto,
                            lojaVendedora:
                                widget.detalhesProduto.nomeLojaVendedora,
                            idComprador: valueOrDefault(
                                currentUserDocument?.idCliente, ''),
                          );
                          await SubprodutosRecord.collection
                              .doc()
                              .set(subprodutosCreateData);

                          final produtosUpdateData = createProdutosRecordData(
                            estaSelecionado: true,
                          );
                          await widget.detalhesProduto.reference
                              .update(produtosUpdateData);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Produto adicionado ao carrinho',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                              ),
                              duration: Duration(milliseconds: 1500),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).dark900,
                            ),
                          );
                        }
                      },
                      text:
                          'Adicionar ao carrinho: ${functions.retornaValorTotal(countControllerValue, widget.detalhesProduto.precoProduto)}',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 16,
                      ),
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
