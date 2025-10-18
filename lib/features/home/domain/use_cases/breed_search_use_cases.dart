import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';

class BreedSearchUseCases {
  final HomeRepo homeRepo;

  BreedSearchUseCases({required this.homeRepo});

  Future<ApiResulte<List<Breed>>> getDataSearch({
    required String q,
    required int attchImage,
  }) {
    return homeRepo.getDataSearch(q: q, attchImage: attchImage);
  }
}
