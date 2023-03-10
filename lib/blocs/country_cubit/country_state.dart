part of 'country_cubit.dart';

abstract class CountryState extends Equatable {
  final String svgUrl;
  final String callNum;
  final String input;

  CountryState copyWith({String? svgUrl, String? callNum, String? input}) {
    return CountrySubmissionFail(
      svgUrl ?? this.svgUrl,
      callNum ?? this.callNum,
      input ?? this.input,
    );
  }

  const CountryState(this.svgUrl, this.callNum, this.input);

  @override
  List<Object> get props => [svgUrl, callNum, input];
}

class CountryInitial extends CountryState {
  const CountryInitial(super.svgUrl, super.callNum, super.input);
}

class CountryLoading extends CountryState {
  const CountryLoading(super.svgUrl, super.callNum, super.input);
}

class CountrySubmissionFail extends CountryState {
  const CountrySubmissionFail(super.svgUrl, super.callNum, super.input);
}

class CountrySubmissionSuccess extends CountryState {
  const CountrySubmissionSuccess(super.svgUrl, super.callNum, super.input);
}
