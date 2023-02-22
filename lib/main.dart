import 'dart:html';

import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Model/TrackField.dart';
import 'Model/cardContent.dart';
import 'Model/cardTrack.dart';
import 'api/apiRest.dart';

void main() {
  return runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var novaPergunta = 0;
  RastreioModel? apiResponse;

  void ptRouter() {
    apiResponse =
        ApiRest.getPackageTraking(_TrackingController) as RastreioModel;
  }

//JN799920292BR
  final TextEditingController _TrackingController =
      TextEditingController(); // controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Iconsax.menu_1, // add custom icons also
            ),
          ),
          title: Center(
            child: Text(
              "Correios+",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            CardTrack(
              child: CardContent(
                textEditingController: _TrackingController,
                icon: Iconsax.box,
                cardTitle: "Package Traking",
                placeholder: "AA123456789BR",
                function: ptRouter,
              ),
            ),
            if (apiResponse != null) getLastTrackResponse(apiResponse!),
          ],
        ),
      ),
    );
  }
}

getLastTrackResponse(RastreioModel? apiResponse) {
  TrackField.last(event: apiResponse?.events.last);
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() => PerguntaAppState();
}
