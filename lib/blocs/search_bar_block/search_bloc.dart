import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/models/country.dart';
import 'package:test_task/repository/country_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CountryRepository _repository;
  SearchBloc(this._repository) : super(const SearchInitial('', [], [])) {
    on<SearchInputInitialized>(_onSearchInputInitialized);
    on<SearchInputSubmitted>(_onSearchInputSubmitted);
  }

  void _onSearchInputInitialized(
    SearchInputInitialized event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(const SearchLoading('', [], []));
      final countries = await _repository.getAll() ?? [];
      emit(
        SearchLoaded(state.query, countries, countries),
      );
    } catch (_) {
      emit(SearchLoadingError('Check your internet connection'));
    }
  }

  void _onSearchInputSubmitted(
    SearchInputSubmitted event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchLoading(
        event.searchInput, state.countries, state.sortedCountries));
    final sortedCountries = state.countries
        .where(
          (element) => element.name.contains(event.searchInput),
        )
        .toList();
    emit(
      SearchLoaded(event.searchInput, state.countries, sortedCountries),
    );
  }
}
