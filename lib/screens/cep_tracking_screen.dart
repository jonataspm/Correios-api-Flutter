import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Util/colorModel.dart';
import '../components/app_bar_model.dart';
import '../components/main_drawer.dart';
import '../api/apiRest.dart';
import '../Model/cardContent.dart';
import '../Model/cardTrack.dart';

class CepTrackingScreen extends State<CepTracking> {
  var apiResponse;

  Future<void> ptRouter() async {
    var cepResponse = await ApiRest.getCepTraking(_TrackingController);
    setState(() {
      apiResponse = cepResponse;
    });
  }

  final TextEditingController _TrackingController =
      TextEditingController(); // controlador para o TextField

  @override
  Widget build(BuildContext context) { 
    
    return Scaffold(
      appBar: AppBarModel(),
      drawer: MainDrawer(),
      backgroundColor: colorBackground,
      body: Column(
        children: [
          CardTrack(
            child: CardContent(
              textEditingController: _TrackingController,
              icon: Iconsax.location,
              cardTitle: "Consultar Cep",
              placeholder: "00000-000",
              onPressed: ptRouter,
            ),
          ),

          Text("Serviço indisponivel",
          style: GoogleFonts.firaCode(
                textStyle: TextStyle(
                  color: colorGrey,
                  fontSize: max(4, 15),
                  fontWeight: FontWeight.bold,))),
          if (apiResponse != null) apiResponse
          // else
          //     CardTrack(
          //       child: Align(
          //           alignment: Alignment.centerLeft,
          //           child: Row(
          //             children: [
          //               Column(
          //                 children: [
          //                   Text("Cidade: "),
          //                   Container(
          //                     margin: EdgeInsets.only(right: 10),
          //                     padding: EdgeInsets.all(10),
          //                     child: Text("Fortaleza"),
          //                     decoration: BoxDecoration(
          //                       color: colorBackground,
          //                       borderRadius: BorderRadius.circular(5),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   Text("UF: "),
          //                   Container(
          //                     padding: EdgeInsets.all(10),
          //                     child: Text("CE"),
          //                     decoration: BoxDecoration(
          //                       color: colorBackground,
          //                       borderRadius: BorderRadius.circular(5),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ],
          //           )),
          //     ),
        
        ],
      ),
    );
  }
}

class CepTracking extends StatefulWidget {
  const CepTracking({super.key});

  @override
  CepTrackingScreen createState() => CepTrackingScreen();
}
