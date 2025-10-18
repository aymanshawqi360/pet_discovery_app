part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Breed> homeBreed;

  const HomeSuccess({required this.homeBreed});
  @override
  List<Object> get props => [homeBreed];
}

class HomeFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

//! DataSearchState

class HomeDataSearch extends HomeState {}

class HomeDataSearchLoading extends HomeState {}

class HomeDataSearchSuccess extends HomeState {
  final List<Breed> dataSearch;

  const HomeDataSearchSuccess({required this.dataSearch});
  @override
  List<Object> get props => [dataSearch];
}

class HomeDataSearchFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeDataSearchFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
