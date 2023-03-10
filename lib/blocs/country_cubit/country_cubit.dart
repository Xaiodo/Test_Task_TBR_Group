import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/mixins/validation_input_mixin.dart';
import 'package:test_task/repository/country_repository.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> with ValidationInputMixin {
  final CountryRepository repository;
  CountryCubit(this.repository)
      : super(const CountryInitial('https://flagcdn.com/ua.svg', '380', ''));

  void initializeCountryNumber(String? countryCode) async {
    final country = await repository.getCountryByAlphacode(countryCode);
    if (country == null) {
      emit(
        const CountryLoaded('https://flagcdn.com/ua.svg', '380', ''),
      );
      return;
    }
    emit(
      CountryLoaded(country.flag, country.callingCodes.first, ''),
    );
  }

  void editedCountryNumber(String svg, String callNum) {
    emit(CountryLoaded(svg, callNum, state.input));
  }

  void editedNumberInput(String input) {
    final formattedInput = formatEditUpdate(input);
    if (isFieldEmpty(formattedInput) || isFieldSubmited(formattedInput)) {
      emit(
        state.copyWith(input: formattedInput),
      );
    }

    emit(
      CountrySubmissionSuccess(state.svgUrl, state.callNum, formattedInput),
    );
  }
}
