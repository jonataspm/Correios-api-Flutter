// ignore_for_file: non_constant_identifier_names

import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'Model/trackField.dart';
import 'Model/cardContent.dart';
import 'Model/cardTrack.dart';
import 'Util/colorModel.dart';
import 'api/apiRest.dart';

void main() {
  return runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var novaPergunta = 0;
  RastreioModel? apiResponse;

  void ptRouter() async {
    var rastro = await ApiRest.getPackageTraking(_TrackingController);
    setState(()  {
      apiResponse = rastro;
    });
  }
//LB783950019HK
//JN799920292BR
  final TextEditingController _TrackingController =
      TextEditingController(); // controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Iconsax.menu_1, // add custom icons also
            ),
          ),
          title: Center(
            child: Text(
              "Correios+",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
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
            if (apiResponse != null) 
              TrackField.unic(
                event: apiResponse!.events.first
                ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() => PerguntaAppState();
}
