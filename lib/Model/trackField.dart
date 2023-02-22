import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_perguntas/api/apiRest.dart';

class TrackField extends Column {

  TrackField.last({ RastreioEvent? event})
   : super(
          children: [
            
          ]
        );

  TrackField({ required List<RastreioEvent> event})
      : super(
          
        );
}
