import 'dart:math';
import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import '../Util/colorModel.dart';
import '../Util/iconModel.dart';

class TrackField extends StatelessWidget {
  final List<RastreioEvent> events;

  TrackField({
    Key? key,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      for (int i = 0; i < events.length; i++)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (i == 1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Padding(padding: EdgeInsets.only(left: 6)),
                  Icon(Iconsax.arrow_up_3, color: colorBlue,),
                  SizedBox(width: 6),
                ],
              ),
            if (i > 1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 6)),
                  Image.asset('assets/images/line.png', color: colorBlue,),
                  SizedBox(width: 6),
                ],
              ),
            TrackField.unic(
              event: events[i],
              marginal: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
          ],
        ),
    ],
  );
}

  static Container unic({
    Key? key,
    required RastreioEvent event,
    EdgeInsetsGeometry? marginal = const EdgeInsets.fromLTRB(20, 10, 20, 10),
  }) {
    return Container(
      margin: marginal,
      child: Row(
        children: [
          Icon(
            IconModel.getIconData(event.status),
            color: colorBlue,
            size: 40,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${event.status}",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: colorBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (event.status !=
                    "Objeto em trânsito - por favor aguarde")
                  Text(
                    "${event.local}\n${event.data} - ${event.hora}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: colorBlack,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Text(
                    "Origem: ${event.origem}\nDestino:${event.destino} \n${event.data} - ${event.hora}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: colorBlack,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
