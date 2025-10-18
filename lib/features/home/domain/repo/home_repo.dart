import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';

abstract class HomeRepo {
  Future<ApiResulte<List<Breed>>> getBreeds({
    required int limit,
    required int page,
  });
  Future<ApiResulte<List<Breed>>> getDataSearch({
    required String q,
    required int attchImage,
  });
}
