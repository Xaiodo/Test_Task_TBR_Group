import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';

import '../widgets/country_code_widget.dart';
import '../widgets/text_field_widget.dart';

class HomeScreen extends StatelessWidget {
  // final Locale deviceLocale;

  const HomeScreen({super.key});

  void _onTap(BuildContext context) {
    print('input successfully submitted');
    context.read<CountryCubit>().initializeCountryNumber('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: state.isValid ? () => _onTap(context) : null,
            backgroundColor: state.isValid
                ? Colors.white
                : Theme.of(context).floatingActionButtonTheme.backgroundColor,
            foregroundColor: state.isValid
                ? const Color(0xff594C74)
                : Theme.of(context).floatingActionButtonTheme.foregroundColor,
            child: const Icon(Icons.arrow_forward_rounded),
          ),
          body: SafeArea(
            child: Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      'Get Started',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CountryCodeWidget(),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: TextFieldWidget(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
