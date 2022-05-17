import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pagamento_confirmado_page/pagamento_confirmado_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FormaDePagamentoPageWidget extends StatefulWidget {
  const FormaDePagamentoPageWidget({Key key}) : super(key: key);

  @override
  _FormaDePagamentoPageWidgetState createState() =>
      _FormaDePagamentoPageWidgetState();
}

class _FormaDePagamentoPageWidgetState
    extends State<FormaDePagamentoPageWidget> {
  bool checkboxListTileValue1;
  TextEditingController textController;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  bool checkboxListTileValue2;
  bool checkboxListTileValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF0F1113),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Subscription',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Outfit',
                color: Color(0xFF0F1113),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x44111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Icon(
                                  Icons.credit_card_rounded,
                                  color: Color(0xFF0F1113),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: CheckboxListTile(
                                      value: checkboxListTileValue1 ??= true,
                                      onChanged: (newValue) => setState(() =>
                                          checkboxListTileValue1 = newValue),
                                      title: Text(
                                        'Cartão de Crédito',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      activeColor: Color(0xFF4B39EF),
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (checkboxListTileValue1 ?? true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 8, 12, 0),
                            child: TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Seu Nome',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        if (checkboxListTileValue1 ?? true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: FlutterFlowCreditCardForm(
                              formKey: creditCardFormKey,
                              creditCardModel: creditCardInfo,
                              obscureNumber: true,
                              obscureCvv: false,
                              spacing: 10,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              inputDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x44111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.ccPaypal,
                                  color: Color(0xFF0F1113),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: CheckboxListTile(
                                      value: checkboxListTileValue2 ??= false,
                                      onChanged: (newValue) => setState(() =>
                                          checkboxListTileValue2 = newValue),
                                      title: Text(
                                        'Paypal',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      activeColor: Color(0xFF4B39EF),
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x44111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.ccApplePay,
                                  color: Color(0xFF0F1113),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: CheckboxListTile(
                                      value: checkboxListTileValue3 ??= false,
                                      onChanged: (newValue) => setState(() =>
                                          checkboxListTileValue3 = newValue),
                                      title: Text(
                                        'Apple Pay',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      activeColor: Color(0xFF4B39EF),
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (checkboxListTileValue3 ?? true)
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Apple Pay',
                          icon: FaIcon(
                            FontAwesomeIcons.apple,
                          ),
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: Color(0xFF0F1113),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFFF1F4F8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      if (checkboxListTileValue1 ?? true)
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PagamentoConfirmadoPageWidget(),
                              ),
                            );
                          },
                          text: 'Pague agora',
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: Color(0xFF0F1113),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFFF1F4F8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      if (checkboxListTileValue2 ?? true)
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Pay w/Paypal',
                          icon: FaIcon(
                            FontAwesomeIcons.paypal,
                          ),
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: Color(0xFF0F1113),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFFF1F4F8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
