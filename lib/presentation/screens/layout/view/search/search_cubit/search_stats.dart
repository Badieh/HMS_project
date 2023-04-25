abstract class SearchState {}

class SearchInitialState extends SearchState {}

class GetSearchLoadingState extends SearchState {}

class GetSearchSuccessState extends SearchState {}

class GetSearchErrorState extends SearchState {
  final String error;

  GetSearchErrorState(this.error);
}
