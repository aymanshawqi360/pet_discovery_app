import 'dart:developer';

import 'package:pet_discovery_app/core/error/api_error_handler.dart';
import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/api/home_api_service.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';

class HomeRepoimplementaion implements HomeRepo {
  final HomeApiService homeApiService;

  HomeRepoimplementaion({required this.homeApiService});

  @override
  Future<ApiResulte<List<Breed>>> getBreeds({
    required int limit,
    required int page,
  }) async {
    try {
      final response = await homeApiService.getBreeds();
      return ApiResulte.success(response);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<List<Breed>>> getDataSearch({
    required String q,
    required int attchImage,
  }) async {
    try {
      final response = await homeApiService.getDataSearch(q, attchImage);

      return ApiResulte.success(response);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
