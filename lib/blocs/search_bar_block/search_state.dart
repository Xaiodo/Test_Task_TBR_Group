part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {
  final String query;
  final List<Country> countries;
  final List<Country> sortedCountries;

  const SearchState(this.query, this.countries, this.sortedCountries);
}

class SearchInitial extends SearchState {
  const SearchInitial(super.query, super.countries, super.sortedCountries);

  @override
  List<Object?> get props => [query, countries];
}

class SearchLoading extends SearchState {
  const SearchLoading(super.query, super.countries, super.sortedCountries);

  @override
  List<Object?> get props => [query, countries];
}

class SearchLoaded extends SearchState {
  const SearchLoaded(super.query, super.countries, super.sortedCountries);

  @override
  List<Object?> get props => [query, countries, sortedCountries];
}

class SearchLoadingError extends SearchState {
  final String message;

  SearchLoadingError(this.message) : super('', [], []);

  @override
  List<Object?> get props => [message];
}
