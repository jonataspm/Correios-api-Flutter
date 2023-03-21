import 'package:correios_rastreio/correios_rastreio.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Model/trackField.dart';
import '../Util/app_routes.dart';

class UnicTracking extends StatelessWidget {
  final RastreioModel apiResponse;

  const UnicTracking({super.key, required this.apiResponse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TrackField.unic(event: apiResponse.events.first),
              ),
            ),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, AppRoutes.PACKGAGE_DETAILS);},
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero,
                  ),
                ),
              ),
              child: const Icon(Iconsax.arrow_right_1),
            ),
          ],
        ),
      ),
    );
  }
}
