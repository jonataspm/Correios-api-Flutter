import 'dart:math';
import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../Util/colorModel.dart';
import '../Util/iconModel.dart';

class TrackField extends Container {
  TrackField.unic({super.key, required RastreioEvent event, EdgeInsetsGeometry? marginal = const EdgeInsets.fromLTRB(20, 10, 20, 10)})
      : super(
          margin: marginal,
          child: Row(
            children: [
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Icon(
                    IconModel.getIconData(event.status),
                    color: colorBlue,
                    size: max(20, 50),
                  )),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${event.status}",
                        style: GoogleFonts.firaCode(
                          textStyle: TextStyle(
                            color: colorBlue,
                            fontSize: max(12, 20),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (event.status !=
                        "Objeto em trânsito - por favor aguarde")
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${event.local}\n${event.data} - ${event.hora}",
                          style: GoogleFonts.firaCode(
                            textStyle: TextStyle(
                              color: colorBlack,
                              fontSize: max(6, 13),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    else
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Origem: ${event.origem}\nDestino:${event.destino} \n${event.data} - ${event.hora}",
                          style: GoogleFonts.firaCode(
                            textStyle: TextStyle(
                              color: colorBlack,
                              fontSize: max(6, 15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        );

  TrackField({super.key, required List<RastreioEvent> events})
      : super(
          child: Column(
            children: [
              for (RastreioEvent event in events) TrackField.unic(event: event, marginal: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            ],
          ),
        );
}
