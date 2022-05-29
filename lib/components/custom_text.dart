import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text, fontFamily;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontFamily: fontFamily , //?? 'Comfortaa'
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
