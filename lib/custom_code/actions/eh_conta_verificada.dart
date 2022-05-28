// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> ehContaVerificada(String email) async {
  var database = FirebaseFirestore.instance.collection('users');

  var resultado = await database
      .where("email", isEqualTo: email)
      .where("contaVerificada", isEqualTo: true)
      .get();

  if (resultado.size > 0) {
    return true;
  } else {
    return false;
  }
}
