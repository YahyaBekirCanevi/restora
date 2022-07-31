import 'package:flutter/material.dart';

class RestoraImage extends StatelessWidget {
  const RestoraImage({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: width == null
              ? height == null
                  ? BoxFit.cover
                  : BoxFit.fitHeight
              : BoxFit.fitWidth,
          image: const AssetImage('assets/images/restora_cut.png'),
        ),
      ),
    );
  }
}
