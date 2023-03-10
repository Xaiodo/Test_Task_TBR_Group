import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';
import 'package:test_task/mixins/modal_bottom_sheet.dart';

class CountryCodeWidget extends StatelessWidget with ModalBottomSheetMixin {
  CountryCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addModalBottomSheet(context),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(19.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: SvgPicture.network(
                    state.svgUrl,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '+${state.callNum}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
