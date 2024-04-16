import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.labelText = '',
    this.labelTextStyle,
    this.keyboardType,
    this.obscureText = false,
    this.icon,
    this.readOnly = false,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.contentPadding,
    this.maxLines = 1,
    this.validator, // Make the validator parameter optional
  }) : super(key: key);

  final String labelText;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final bool readOnly;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final int maxLines;
  final String? Function(String?)? validator; // Make validator function nullable

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? formatters;
    if (inputFormatters != null) {
      formatters = inputFormatters!
          .whereType<TextInputFormatter>()
          .toList();
    }

    return SizedBox(
      height: maxLines * 56.0, // Adjusted height for outlined text field
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), // Adjust border radius as needed
              border: Border.all(color: Colors.grey), // Adjust outline color
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding as needed
              child: TextFormField(
                cursorColor: Colors.grey,
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText,
                readOnly: readOnly,
                onTap: onTap,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
                validator: validator, // Pass nullable validator function to validator parameter
                maxLines: maxLines,
                inputFormatters: formatters,
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: labelTextStyle,
                  contentPadding: contentPadding ?? const EdgeInsets.all(6),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  border: InputBorder.none,
                  prefixIcon: prefixIcon != null
                      ? InkWell(
                    onTap: onTap,
                    child: Icon(prefixIcon),
                  )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
