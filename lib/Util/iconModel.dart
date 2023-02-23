import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconModel {
  static IconData getIconData(String status) {
    switch (status) {
      case "Objeto entregue ao destinatário":
        return Iconsax.like_shapes;

      case "Objeto saiu para entrega ao destinatário":
        return Iconsax.flash;

      case "Objeto em trânsito - por favor aguarde":
        return Iconsax.truck_fast;

      case "Fiscalização aduaneira finalizada":
        return Iconsax.box_search;

      case "Objeto recebido pelos Correios do Brasil":
        return Iconsax.courthouse;

      case "Objeto postado":
        return Iconsax.box_tick;

      default:
        return Iconsax.clipboard_export;
    }
  }
}
