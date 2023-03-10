import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_bar_block/search_bloc.dart';
import '../country_item_widget.dart';

class ModalCountryItemBuilder extends StatelessWidget {
  const ModalCountryItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 100),
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
              itemCount: state.sortedCountries.length,
              itemBuilder: (context, index) {
                return CountryItemWidget(
                  country: state.sortedCountries[index],
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
    );
  }
}
