import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';
import 'package:test_task/models/country.dart';

class CountryItemWidget extends StatelessWidget {
  final Country country;
  const CountryItemWidget({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CountryCubit>().editedCountryNumber(
              country.flag,
              country.callingCodes.first,
            );
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: SvgPicture.network(
              country.flag,
              width: 30,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '+${country.callingCodes.first}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              country.name,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
