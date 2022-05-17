import '../detalhes_produto_page/detalhes_produto_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../forma_de_pagamento_page/forma_de_pagamento_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaCarrinhoPageWidget extends StatefulWidget {
  const ListaCarrinhoPageWidget({Key key}) : super(key: key);

  @override
  _ListaCarrinhoPageWidgetState createState() =>
      _ListaCarrinhoPageWidgetState();
}

class _ListaCarrinhoPageWidgetState extends State<ListaCarrinhoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF1D2429),
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Voltar',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Product Sans',
                              color: Color(0xFF1D2429),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Carrinho',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Product Sans',
                          color: Color(0xFF1D2429),
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalhesProdutoPageWidget(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Hero(
                                      tag: 'ControllerImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://media.direct.playstation.com/is/image/sierialto/dualsense-ps5-controller-white-accessory-front',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              'Controller Basic',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Product Sans',
                                                    color: Color(0xFF1D2429),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            '\$125.50',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Product Sans',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'Quantidade: 1',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Product Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color: Color(0xFF57636C),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Color(0xFFE86969),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalhesProdutoPageWidget(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Hero(
                                      tag: 'ControllerImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://media.direct.playstation.com/is/image/sierialto/dualsense-ps5-controller-white-accessory-front',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              'Controller Basic',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Product Sans',
                                                    color: Color(0xFF1D2429),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            '\$125.50',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Product Sans',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'Quantidade: 1',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Product Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color: Color(0xFF57636C),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Color(0xFFE86969),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Resumo',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valor Base',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            '\$156.00',
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF1D2429),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxas',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            '\$24.20',
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF1D2429),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Frete',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            '\$40.00',
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF1D2429),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 36,
                                icon: Icon(
                                  Icons.info_outlined,
                                  color: Color(0xFF57636C),
                                  size: 18,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                          Text(
                            '\$230.20',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Product Sans',
                                  color: Color(0xFF1D2429),
                                  fontSize: 32,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormaDePagamentoPageWidget(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x320E151B),
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
                alignment: AlignmentDirectional(0, -0.35),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormaDePagamentoPageWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Prosseguir (VALOR)',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Product Sans',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
