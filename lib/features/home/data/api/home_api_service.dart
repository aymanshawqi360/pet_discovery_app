// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:pet_discovery_app/core/networking/dio_factory.dart';
// import 'package:pet_discovery_app/features/home/data/api/home_api_constants.dart';

// class HomeApiService {
//   final DioFactory dioFactory;
//   HomeApiService({required this.dioFactory});

//   Future<Response> getBestCars({required int limit, required int page}) async {
//     try {
//       final response = await dioFactory.get(
//         HomeApiConstants.breeds,
//         queryParametes: {'limit': limit, 'page': page},
//       );
//       // log(response.data.toString());
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:dio/dio.dart';

import 'package:pet_discovery_app/features/home/data/api/home_api_constants.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/v1/')
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.breeds)
  Future<List<Breed>> getBreeds();
  @GET(HomeApiConstants.breeds)
  Future<List<Breed>> getDataSearch(
    @Query("q") String q,
    @Query("attach_image") int attchImage,
  );
}
