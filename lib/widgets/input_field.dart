
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.label,
      required this.controller,
      required this.horizontalPadding,
      required this.type,
      required this.validator});

  final String label;
  final TextEditingController controller;
  final double horizontalPadding;
  final TextInputType type;
  final String? Function(String? value) validator;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    double padding = widget.horizontalPadding;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            label: Text(widget.label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        keyboardType: widget.type,
        validator: widget.validator
      ),
    );
  }
}
