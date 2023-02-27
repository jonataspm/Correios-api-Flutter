import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarModel extends AppBar {
  @override
  AppBarModel({
    super.key,
  }) : super(
          title: Text(
            "Buscorreos",
            style: GoogleFonts.firaCode(
              textStyle: const TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}
