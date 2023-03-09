part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class SearchInputInitialized extends SearchEvent {
  final String query;

  SearchInputInitialized(this.query);
  @override
  List<Object?> get props => [];
}

class SearchInputSubmitted extends SearchEvent {
  final String searchInput;

  SearchInputSubmitted({required this.searchInput});

  @override
  List<Object?> get props => [searchInput];
}
