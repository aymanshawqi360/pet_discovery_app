import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';

class BreedUseCases {
  final HomeRepo homeRepo;

  BreedUseCases({required this.homeRepo});
  Future<ApiResulte<List<Breed>>> getBreed({
    required int limit,
    required int page,
  }) {
    return homeRepo.getBreeds(limit: limit, page: page);
  }
}
