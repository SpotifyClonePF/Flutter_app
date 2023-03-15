import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final Icon icon;
  final TextInputType keyboard;
  final bool obscureText;
  final void Function(String data) onChanged;
  final String? Function(String? data)? validator;
  const InputText({
    Key? key,
    this.label = '',
    this.hint = '',
    required this.icon,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: keyboard,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 15.0
          ),
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
