import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:flutter/material.dart';

class ApiRest {


  static Future<RastreioModel> getPackageTraking(TextEditingController trackingController) async {
    var correios = CorreiosRastreio();
    final package = await correios.rastrearEncomenda(trackingController.text);
    print("código do rastreio: ${package.code}");
    return package;
  }
/*
  static Future<ObjetoRastreio> fazerRastreio({required String codRastreio}) async {
    ObjetoRastreio retorno = new ObjetoRastreio.vd(); 
    try {
      final response = await http.get(
          Uri.parse("https://api.postmon.com.br/v1/rastreio/ect/$codRastreio"),
          headers: {"Content-Type": "text/json; charset=utf-8"});
      if (response.statusCode == 200) {
        retorno = ObjetoRastreio(response.body);
      } else {
        print("Erro na requisição");
      }
      return retorno;
    } catch (e) {
      print(e);
    }
    return retorno;
  }



  static void getPackageTraking2(TextEditingController trackingController) async {
    var correios = CorreiosRastreio();
    final package = await correios.rastrearEncomenda('TE069330491BR');
    final events = package.events;
    print(events.length);
    print(events[0].data);
    print(events[0].hora);
    print(events[0].destino);
    print(events[0].status);
    print(events[0].origem);
    print(events[0].local);
  }
*/
}
