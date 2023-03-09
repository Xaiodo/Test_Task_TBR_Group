import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryItemWidget extends StatelessWidget {
  final String svgUrl;
  final String name;
  final int callingCode;
  const CountryItemWidget({
    super.key,
    required this.svgUrl,
    required this.name,
    required this.callingCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2.0),
          child: SvgPicture.network(
            svgUrl,
            width: 25,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '+$callingCode',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
