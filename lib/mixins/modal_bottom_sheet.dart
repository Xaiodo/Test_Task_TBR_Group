import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_task/widgets/modal_widgets/modal_country_item_builder.dart';
import 'package:test_task/widgets/modal_widgets/modal_header_widget.dart';
import 'package:test_task/widgets/modal_widgets/modal_search_input_widget.dart';

mixin ModalBottomSheetMixin {
  void addModalBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const ModalHeaderWidget(),
                const SizedBox(
                  height: 10,
                ),
                ModalSearchInputWidget(),
                const ModalCountryItemBuilder(),
              ],
            ),
          ),
        );
      },
    );
  }
}
