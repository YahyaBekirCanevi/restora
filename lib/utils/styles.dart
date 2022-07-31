import 'package:flutter/material.dart';

const h1TextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w500,
);

kBoxShadow(Color color) => [
      BoxShadow(
        blurRadius: 4,
        color: color,
        spreadRadius: 1,
        offset: const Offset(4, 6),
      )
    ];
