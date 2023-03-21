import '/Util/colorModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '/Util/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTapFunc) {
    return ListTile(
      leading: Icon(
        icon,
        color: colorWhite,
        size: 26,
      ),
      
      title: Text(
        label,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 16,
          ),
          color: colorWhite,
        ),
      ),
      onTap: onTapFunc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            // Icon(
            //   Iconsax.previous,
            //   color: Colors.white,
            //   size: 20,
            // ),
            //const SizedBox(width: 6),
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Text(
                "Menu",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            _createItem(Iconsax.box, 'Rastrear Encomendas',
                () => Navigator.of(context).pushNamed(AppRoutes.HOME)),
            _createItem(Iconsax.location, 'Consultar CEP',
                () => Navigator.pushNamed(context, AppRoutes.CEPTRACKING)),
          ],
        ));
  }
}
