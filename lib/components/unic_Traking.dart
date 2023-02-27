import 'dart:math';

import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/trackField.dart';
import '../Util/app_routes.dart';
import '../Util/colorModel.dart';

class UnicTracking extends StatelessWidget {
  final RastreioModel apiResponse;

  const UnicTracking({required this.apiResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Ultima Atualização",
              style: GoogleFonts.firaCode(
                textStyle: TextStyle(
                  color: colorGrey,
                  fontSize: max(4, 13),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TrackField.unic(event: apiResponse.events.first),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.PACKGAGE_DETAILS);
            },
            child: Text(
              "mostrar mais",
              style: GoogleFonts.firaCode(
                textStyle: TextStyle(
                  color: colorGrey,
                  fontSize: max(4, 13),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
