import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_task/blocs/search_bar_block/search_bloc.dart';
import 'package:test_task/widgets/country_item_widget.dart';

mixin ModalBottomSheetMixin {
  void addModalBottomSheet(BuildContext context) {
    final textController = TextEditingController();
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
                Row(
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
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: textController,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(
                          SearchInputSubmitted(searchInput: value),
                        );
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: SvgPicture.asset(
                        'assets/svg/Search.svg',
                      ),
                    ),
                    hintText: 'Search',
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is SearchLoaded) {
                      return Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 24,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: state.countries.length,
                          itemBuilder: (context, index) {
                            return CountryItemWidget(
                              country: state.countries[index],
                            );
                          },
                        ),
                      );
                    }
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Check your internet connection'),
                      ),
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
