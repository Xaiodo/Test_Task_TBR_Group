import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/search_bar_block/search_bloc.dart';

class ModalSearchInputWidget extends StatelessWidget {
  ModalSearchInputWidget({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        _controller.text = state.query;
        _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
        return TextField(
          controller: _controller,
          onChanged: (value) {
            context.read<SearchBloc>().add(
                  SearchInputSubmitted(searchInput: value),
                );
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            prefixIcon: GestureDetector(
              onTap: () => context.read<SearchBloc>().add(
                    SearchInputSubmitted(
                      searchInput: _controller.text,
                    ),
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SvgPicture.asset(
                  'assets/svg/Search.svg',
                ),
              ),
            ),
            hintText: 'Search',
          ),
        );
      },
    );
  }
}
