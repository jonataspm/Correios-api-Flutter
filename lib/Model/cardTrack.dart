import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTrack extends Container {
  CardTrack({
    required Widget child,
  }) : super(
          child: child,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          constraints: BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        );
}
