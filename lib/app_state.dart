import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences prefs;

  String emailUsuario = '';

  String tokenCode = '';

  bool mostrarListaCompleta = true;

  bool mostrarFiltroCategoria = false;

  String tipoFiltroPesquisa = '';

  bool mostrarListaPesquisa = false;

  bool mostrarListaCompletaMenuLoja = true;

  String lojaQueEstaNoCarrinho = '';

  String lojaVendedoraCarrinhoNome = '';

  String fotoLojaVendedoraCarrinho;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
