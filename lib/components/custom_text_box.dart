import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restora/utils/colors.dart';

class CustomTextBox extends HookWidget {
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final Icon? decorationIcon;
  final bool obscureBool, readOnly;
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
    this.decorationIcon,
    this.obscureBool = false,
    this.readOnly = false,
    this.validator,
    this.onTextChanged,
    this.controller,
    this.borderless = false,
    this.customFontSize = 18,
    this.textColor,
    this.fillcolor,
    this.focusColor = kSecondaryTintColor,
    this.borderColor = Colors.black,
    this.suffixWidget = const SizedBox(),
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.maxLength,
    this.digitsOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var confirmObscured = useState<bool>(obscureBool);

    return TextFormField(
      maxLength: maxLength,
      inputFormatters: digitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      keyboardType: keyboardType ?? TextInputType.multiline,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      obscureText: confirmObscured.value,
      onChanged: onTextChanged,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontFamily: 'Comfortaa',
        fontSize: customFontSize,
      ),
      cursorColor: focusColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillcolor ?? Colors.white,
        prefixIcon: decorationIcon,
        suffixIcon: (obscureBool)
            ? IconButton(
                onPressed: () => confirmObscured.value = !confirmObscured.value,
                icon: confirmObscured.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : suffixWidget,
        labelText: label,
        border: !borderless
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor!),
              )
            : null,
        focusedBorder: !borderless
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: focusColor!),
              )
            : null,
      ),
    );
  }
}
