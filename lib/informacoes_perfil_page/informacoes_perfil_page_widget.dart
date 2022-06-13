import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformacoesPerfilPageWidget extends StatefulWidget {
  const InformacoesPerfilPageWidget({Key key}) : super(key: key);

  @override
  _InformacoesPerfilPageWidgetState createState() =>
      _InformacoesPerfilPageWidgetState();
}

class _InformacoesPerfilPageWidgetState
    extends State<InformacoesPerfilPageWidget> {
  TextEditingController cEPFieldController;
  TextEditingController cPFFieldController;
  TextEditingController nomeFieldController;
  TextEditingController telefoneFieldController;
  TextEditingController enderecoFieldController;
  TextEditingController numeroFieldController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cEPFieldController = TextEditingController(text: '[User Email]');
    cPFFieldController = TextEditingController(text: '[User Name]');
    nomeFieldController = TextEditingController(text: '[User Email]');
    telefoneFieldController = TextEditingController(text: '[User Email]');
    enderecoFieldController = TextEditingController(text: '[User Email]');
    numeroFieldController = TextEditingController(text: '[User Name]');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Configuração de perfil',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x430F1113),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/man.png',
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: nomeFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'Enter a new email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: cPFFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Your Nam',
                                        hintText: 'What do people call you...?',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }
                                        if (val.length < 11) {
                                          return 'CPF Invalido!';
                                        }
                                        if (val.length > 14) {
                                          return 'CPF Invalido!';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: telefoneFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'Enter a new email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.phone,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }
                                        if (val.length < 11) {
                                          return 'Telefone Inválido!';
                                        }
                                        if (val.length > 11) {
                                          return 'Telefone Inválido';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: enderecoFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'Enter a new email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.streetAddress,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: numeroFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Your Nam',
                                        hintText: 'What do people call you...?',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: cEPFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'Enter a new email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Campo obrigatório!';
                                        }
                                        if (val.length < 8) {
                                          return 'CEP Inválido!';
                                        }
                                        if (val.length > 9) {
                                          return 'CEP Inválido!';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (formKey.currentState == null ||
                                !formKey.currentState.validate()) {
                              return;
                            }

                            final usersUpdateData = createUsersRecordData(
                              displayName: nomeFieldController.text,
                              cpfCliente: cPFFieldController.text,
                              phoneNumber: telefoneFieldController.text,
                              enderecoCliente: enderecoFieldController.text,
                              numeroCasaCliente: numeroFieldController.text,
                              cepCliente: cEPFieldController.text,
                              ehPrimeiraVez: false,
                            );
                            await currentUserReference.update(usersUpdateData);
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
                          text: 'Salvar Informações',
                          options: FFButtonOptions(
                            width: 230,
                            height: 50,
                            color: FlutterFlowTheme.of(context).black600,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
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
    );
  }
}
