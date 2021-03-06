import 'package:flutter/material.dart';
import 'package:restora/components/custom_text.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function()? pressAction;
  final double? height, width;
  final IconData? leftIcon, rightIcon;
  final Color? backgroundColor, foregroundColor;

  const CustomButton({
    Key? key,
    this.pressAction,
    this.leftIcon,
    this.rightIcon,
    this.height = 40,
    this.width,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.pressAction,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              widget.backgroundColor ?? Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.height! / 2),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.leftIcon != null)
              Icon(
                widget.leftIcon,
                size: 20,
                color: widget.foregroundColor ?? Colors.white,
              ),
            CustomText(
              text: (widget.leftIcon != null ? "  " : "") + widget.title,
              color: widget.foregroundColor ?? Colors.white,
            ),
            if (widget.rightIcon != null)
              Icon(
                widget.rightIcon,
                size: 20,
                color: widget.foregroundColor ?? Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}