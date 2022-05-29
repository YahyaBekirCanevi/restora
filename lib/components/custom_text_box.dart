import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextBox extends StatefulWidget {
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label, hint;
  final Icon? decorationIcon;
  final bool? obscureBool, readOnly;
  final bool borderless;
  final void Function(String)? onTextChanged;
  final double customFontSize;
  final Color? fillcolor, textColor, focusColor, borderColor;
  final int? maxLines, minLines, maxLength;
  final TextInputType? keyboardType;
  final bool digitsOnly;

  const CustomTextBox({
    Key? key,
    this.label,
    this.hint,
    this.decorationIcon,
    this.obscureBool = false,
    this.readOnly = false,
    this.validator,
    this.onTextChanged,
    this.controller,
    this.borderless = false,
    this.customFontSize = 16,
    this.textColor,
    this.fillcolor,
    this.focusColor,
    this.borderColor = Colors.black,
    this.suffixWidget = const SizedBox(),
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.maxLength,
    this.digitsOnly = false,
  }) : super(key: key);

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool confirmObscured = false;

  @override
  void initState() {
    confirmObscured = widget.obscureBool!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      //autofocus: true,
      //focusNode: FocusNode(),
      inputFormatters: widget.digitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      keyboardType: widget.keyboardType ?? TextInputType.multiline,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      controller: widget.controller,
      readOnly: widget.readOnly!,
      validator: widget.validator,
      obscureText: confirmObscured,
      onChanged: widget.onTextChanged,
      style: TextStyle(
        color: widget.textColor ?? Colors.black,
        fontFamily: 'Comfortaa',
        fontSize: widget.customFontSize,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillcolor ?? Colors.white,
        prefixIcon: widget.decorationIcon,
        suffixIcon: (widget.obscureBool!)
            ? IconButton(
          onPressed: () {
            setState(() {
              confirmObscured = !confirmObscured;
            });
          },
          icon: confirmObscured
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        )
            : widget.suffixWidget,
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hint,
        border: !widget.borderless
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: widget.borderColor!),
        )
            : null,
      ),
    );
  }
}