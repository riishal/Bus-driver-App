import 'package:flutter/material.dart';

class TextformWidget extends StatelessWidget {
  const TextformWidget({
    super.key,
    required this.size,
    required this.controller,
    required this.hintText,
  });

  final Size size;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(42, 42, 42, 0.1),
          borderRadius: BorderRadius.circular(12)),
      height: size.height * 0.084,
      width: size.width * 0.89,
      child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.only(
            //   left: 120,
            // ),
            hintText: hintText,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          )),
    );
  }
}
