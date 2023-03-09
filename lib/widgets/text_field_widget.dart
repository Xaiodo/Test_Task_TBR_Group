import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      cursorColor: Colors.black,
      cursorHeight: 16,
      cursorWidth: 1.5,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
