import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_discovery_app/core/error/api_error_model.dart';
import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:pet_discovery_app/features/home/domain/use_cases/breed_use_cases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedUseCases breedUseCases;
  HomeCubit({required this.breedUseCases}) : super(HomeInitial());

  void getBreedState() async {
    emit(HomeLoading());
    final response = await breedUseCases.getBreed(limit: 10, page: 1);

    if (response is Success<List<Breed>>) {
      log("message");

      emit(HomeSuccess(homeBreed: response.data ?? []));
    } else if (response is Failure<List<Breed>>) {
      emit(
        HomeFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }
}
