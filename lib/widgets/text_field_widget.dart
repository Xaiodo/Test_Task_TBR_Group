import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/country_cubit/country_cubit.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        _controller.text = state.input;
        _controller.selection =
            TextSelection.collapsed(offset: _controller.text.length);
        return TextField(
          controller: _controller,
          onChanged: (value) {
            context.read<CountryCubit>().editedNumberInput(value);
          },
          autofocus: true,
          cursorColor: Colors.black,
          cursorHeight: 16,
          cursorWidth: 1.5,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: const InputDecoration(
            hintText: 'Your phone number',
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(14),
          ],
        );
      },
    );
  }
}
