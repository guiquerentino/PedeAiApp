import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String retornaValorTotal(
  int qtdProdutos,
  double valorProduto,
) {
  var total = qtdProdutos * valorProduto;
  var f = NumberFormat("###.0#", "pt_BR");
  return "R\$" + f.format(total);
}

double somarSubtotal(
  double valorSubtotal,
  double preco,
) {
  valorSubtotal = valorSubtotal + preco;

  return valorSubtotal;
}

double diminuirSubtotal(
  double valorSubtotal,
  double preco,
) {
  if (valorSubtotal > 0) {
    valorSubtotal = valorSubtotal - preco;
  }

  return valorSubtotal;
}

String valorTotalCarrinhoString(List<double> subtotal) {
  {
    double total = 0;
    for (double add in subtotal) {
      total += add;
    }
    var f = NumberFormat("###.0#", "pt_BR");
    return "R\$" + f.format(total);
  }
}

double somaProdutoEQuantidade(
  int qtd,
  double preco,
) {
  return qtd * preco;
}

double valorTotalCarrinhoDouble(List<double> subtotal) {
  double total = 0;
  for (double add in subtotal) {
    total += add;
  }
  return total;
}
