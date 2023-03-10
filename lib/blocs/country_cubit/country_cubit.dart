import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/mixins/validation_input_mixin.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> with ValidationInputMixin {
  CountryCubit() : super(const CountryInitial('', '', ''));

  void initializeCountryNumber() {
    emit(
      const CountryInitial('https://flagcdn.com/ua.svg', '380', ''),
    );
  }

  void editedCountryNumber(String svg, String callNum) {
    emit(state.copyWith(svgUrl: svg, callNum: callNum));
    editedNumberInput(state.input);
  }

  void editedNumberInput(String input) {
    final formattedInput = formatEditUpdate(input);
    if (isFieldEmpty(formattedInput)) {
      emit(
        state.copyWith(input: formattedInput),
      );
    }
    if (isFieldSubmited(formattedInput)) {
      emit(
        CountrySubmissionSuccess(state.svgUrl, state.callNum, formattedInput),
      );
    } else {
      emit(
        state.copyWith(input: formattedInput),
      );
    }
  }
}
