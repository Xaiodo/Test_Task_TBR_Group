import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/mixins/modal_bottom_sheet.dart';

class CountryCodeWidget extends StatelessWidget with ModalBottomSheetMixin {
  const CountryCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addModalBottomSheet(context),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.network(
              'https://flagcdn.com/mm.svg',
              width: 30,
            ),
            Text(
              '+380',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
