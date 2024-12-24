import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        // minLines: 2,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 23.0),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 35, 5, 233)),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 1, 149, 255)),
              borderRadius: BorderRadius.circular(10.0)),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),

        style:
            const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
      ),
    );
  }
}
