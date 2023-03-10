import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';
import 'package:test_task/blocs/search_bar_block/search_bloc.dart';
import 'package:test_task/repository/country_repository.dart';
import 'package:test_task/screens/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CountryRepository repository = CountryRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(repository)
            ..add(
              SearchInputInitialized(''),
            ),
        ),
        BlocProvider(
          create: (context) => CountryCubit()..initializeCountryNumber(),
        ),
      ],
      child: MaterialApp(
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}
