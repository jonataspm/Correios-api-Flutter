import 'dart:convert';

import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:flutter/material.dart';
import '../api/url.dart';
import '../Model/Cep.dart';
import 'package:http/http.dart' as http;

class ApiRest {
  static Future<RastreioModel> getPackageTraking( TextEditingController trackingController) async {
    var correios = CorreiosRastreio();
    final package = await correios.rastrearEncomenda(trackingController.text);
    print("código do rastreio: ${package.code}");
    return package;
  }

  static Future<Cep> getCepTraking(
      TextEditingController trackingController) async {
    final url = Uri.parse('${BASECEP}/${trackingController.text}/json');
    final response = await http.get(url, headers: {
      'content-type': 'text; charset=utf-8',
      'cache-control': 'no-cache'
    });
    print(url.toString());

    return Cep.fromJson(jsonDecode(response.body));
  }
}
