import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

import '../Model/trackField.dart';
import '../Model/cardContent.dart';
import '../Model/cardTrack.dart';
import '../Util/colorModel.dart';
import '../api/apiRest.dart';
import '../components/main_drawer.dart';
import '../components/app_bar_model.dart';

class PackageTrackingScreen extends State<PackageTracking>{

  var apiResponse;
  final TextEditingController _TrackingController = TextEditingController(); // controlador para o TextField
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBarModel(),
        drawer: MainDrawer(),
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
              TrackField.unic(event: apiResponse!.events.first)
          ],
        ),
      ),
    );
  }

  //LB783950019HK - JN799920292BR
  void ptRouter() async {
    var rastro = await ApiRest.getPackageTraking(_TrackingController);
    setState(() {
      apiResponse = rastro;
    });
  }
}


class PackageTracking extends StatefulWidget {

  @override
  PackageTrackingScreen createState() => PackageTrackingScreen();
}