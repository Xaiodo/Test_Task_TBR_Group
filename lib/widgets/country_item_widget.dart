import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryItemWidget extends StatelessWidget {
  final String svgUrl;
  final String name;
  final String callingCode;
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
            width: 30,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '+$callingCode',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
