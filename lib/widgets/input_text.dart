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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        keyboardType: widget.keyboard,
        obscureText: !showPassword && widget.obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          suffixIcon: widget.showPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                )
              : Icon(
                  widget.icon.icon,
                  color: Colors.black,
          ),
          suffixIconColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
