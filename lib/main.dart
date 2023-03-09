import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/search_bar_block/search_bloc.dart';
import 'package:test_task/repository/country_repository.dart';
import 'package:test_task/widgets/country_code_widget.dart';
import 'package:test_task/widgets/text_field_widget.dart';
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
        )
      ],
      child: MaterialApp(
        theme: theme,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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
                        children: const [
                          CountryCodeWidget(),
                          SizedBox(
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
        ),
      ),
    );
  }
}
