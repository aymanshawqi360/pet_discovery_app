import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_discovery_app/core/networking/dio_factory.dart';
import 'package:pet_discovery_app/features/home/data/api/home_api_service.dart';
import 'package:pet_discovery_app/features/home/data/repo_implementation/home_repo_implementaion.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';
import 'package:pet_discovery_app/features/home/domain/use_cases/breed_use_cases.dart';
import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  //! DioFactory

  Dio dio = DioFactory.initDio();
  // sl.registerLazySingleton<Dio>(() => Dio());
  // sl.registerLazySingleton<DioFactory>(() => DioFactory());

  //!Data

  sl.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  //!RepoImpl

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoimplementaion(homeApiService: sl()),
  );

  //!UseCases

  sl.registerLazySingleton<BreedUseCases>(() => BreedUseCases(homeRepo: sl()));

  //!Cubit

  sl.registerFactory(() => HomeCubit(breedUseCases: sl()));
}
