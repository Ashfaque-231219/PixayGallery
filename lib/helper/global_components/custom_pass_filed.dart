import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextPasswordField extends StatefulWidget {
  const AppTextPasswordField({
    Key? key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.labelText = '',
    this.labelTextStyle,
    this.keyboardType,
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
  _AppTextPasswordFieldState createState() => _AppTextPasswordFieldState();
}

class _AppTextPasswordFieldState extends State<AppTextPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? formatters;
    if (widget.inputFormatters != null) {
      formatters = widget.inputFormatters!
          .whereType<TextInputFormatter>()
          .toList();
    }

    return SizedBox(
      height: widget.maxLines * 56.0, // Adjusted height for outlined text field
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
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: _isObscure,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onFieldSubmitted,
                validator: widget.validator, // Pass nullable validator function to validator parameter
                maxLines: widget.maxLines,
                inputFormatters: formatters,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  labelStyle: widget.labelTextStyle,
                  contentPadding: widget.contentPadding ?? const EdgeInsets.all(6),
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                  border: InputBorder.none,
                  prefixIcon: widget.prefixIcon != null
                      ? InkWell(
                    onTap: widget.onTap,
                    child: Icon(widget.prefixIcon),
                  )
                      : null,
                  suffixIcon:
                       IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
