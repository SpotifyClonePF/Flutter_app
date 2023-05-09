import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  final Icon icon;
  final TextInputType keyboard;
  final bool obscureText;
  final bool showPassword;
  final void Function(String data) onChanged;
  final String? Function(String? data)? validator;

  const InputText({
    Key? key,
    this.label = '',
    this.hint = '',
    required this.icon,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    this.showPassword = false,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      obscureText: !showPassword && widget.obscureText,
      cursorColor: Colors.grey,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 15.0,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey,
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
        suffixIcon: widget.showPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  widget.icon.icon,
                  color: Colors.grey,
                ),
              ),
        suffixIconColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 15.0,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
