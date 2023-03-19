import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'Model/Cep.dart';
import 'Model/trackField.dart';
import 'Model/cardContent.dart';
import 'Model/cardTrack.dart';
import 'Util/app_routes.dart';
import 'Util/colorModel.dart';
import 'api/apiRest.dart';
import 'components/main_drawer.dart';
import 'components/app_bar_model.dart';
import 'components/unic_Traking.dart';
import 'screens/cep_tracking_screen.dart';
import 'screens/package_detail_screen.dart';
import 'screens/package_tracking_screen.dart';

void main() {
  return runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  RastreioModel? apiResponse;

  Future<void> ptRouter() async {
    var rastro = await ApiRest.getPackageTraking(_TrackingController);
    setState(() {
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
          appBar: AppBarModel(),
          drawer: MainDrawer(),
          body: Column(
            children: [
              CardTrack(
                child: CardContent(
                  textEditingController: _TrackingController,
                  icon: Iconsax.box,
                  cardTitle: "Rastreamento",
                  placeholder: "AA123456789BR",
                  onPressed: ptRouter,
                ),
              ),
              if (apiResponse != null)
                UnicTracking(apiResponse: apiResponse!),
            ],
          ),
        ),
        routes: {
          //AppRoutes.HOME: (ctx) => PackageTracking(),
          AppRoutes.CEPTRACKING: (context) => CepTracking(),
          AppRoutes.PACKGAGE_DETAILS: (context) => PackageDetailScreen(apiResponse!)
        });
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() => PerguntaAppState();
}
