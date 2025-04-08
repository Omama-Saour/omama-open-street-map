import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final controler;
  final String hint;

  const MyInput({
    super.key,
    required this.controler,
    required this.hint,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controler,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2)
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}