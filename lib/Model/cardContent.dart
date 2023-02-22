import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CardContent extends Column {
  CardContent({
    required TextEditingController? textEditingController,
    required IconData icon,
    required String cardTitle,
    required String placeholder,
    required void Function() function,
  }) : super(
          children: [
            Center(
              child: Row(
                children: [
                  Icon(icon),
                  Text(
                    cardTitle,
                    style: GoogleFonts.firaCode(
                      textStyle: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: textEditingController, // especificando o controlador
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.search_normal),
                hintText: placeholder,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Pesquisar'),
              onPressed: function,
            ),
          ],
        );
}
