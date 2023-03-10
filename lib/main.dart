import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';
import 'package:test_task/blocs/search_bar_block/search_bloc.dart';
import 'package:test_task/repository/country_repository.dart';
import 'package:test_task/screens/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final CountryRepository repository = CountryRepository();

  @override
  Widget build(BuildContext context) {
    final countryCode = WidgetsBinding.instance.window.locale.countryCode;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(repository)
            ..add(
              SearchInputInitialized(''),
            ),
        ),
        BlocProvider(
          create: (context) =>
              CountryCubit(repository)..initializeCountryNumber(countryCode),
        ),
      ],
      child: MaterialApp(
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}
