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

class PackageDetailScreen extends StatelessWidget {
  final RastreioModel rastreio;
  const PackageDetailScreen(this.rastreio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: colorBackground,
          appBar: AppBarModel(),
          body: CardTrack(
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    rastreio.code,
                    style: GoogleFonts.firaCode(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      color: colorBlue,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1, //espessura da linha
                  color: colorBlue, //cor da linha
                ),
                TrackField(events: rastreio.events)
              ],
            ),
          ),
    );
  }
}
