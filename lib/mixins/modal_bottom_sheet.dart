import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as md;
import 'package:test_task/widgets/country_item_widget.dart';
import 'package:test_task/widgets/text_field_widget.dart';

mixin ModalBottomSheet {
  void addModalBottomSheet(BuildContext context) {
    md.showMaterialModalBottomSheet(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Country code',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Color(0xff594C74),
                        ),
                        style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(8),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    alignLabelWithHint: true,
                    hintText: 'Search',
                    fillColor: const Color(0xffF4F5FF).withOpacity(0.4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: Color(0xff594C74),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const CountryItemWidget(
                      svgUrl: 'https://flagcdn.com/mm.svg',
                      name: 'Myanma',
                      callingCode: 264,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
