import 'package:flutter/material.dart';

class ModalHeaderWidget extends StatelessWidget {
  const ModalHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Icon(
              Icons.close_rounded,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
