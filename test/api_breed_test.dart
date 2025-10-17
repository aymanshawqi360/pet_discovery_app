// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:pet_discovery_app/core/networking/dio_factory.dart';
// import 'package:pet_discovery_app/features/home/data/api/home_api_service.dart';

// import 'api_breed.mocks.dart';

// @GenerateNiceMocks([MockSpec<Dio>()])
// void main() {
//   late MockDio mockDio;
//   late HomeApiService homeApiService;
//   setUp(() {
//     mockDio = MockDio();

//     homeApiService = HomeApiService(mockDio);
//   });

//   test('test name', () async {
//     when(
//       mockDio.get(
//         'https://api.thecatapi.com/v1/breeds',
//         // options: Options(headers: {'Content-Type': 'application/json'}),
//         queryParameters: {'limit': 10, 'page': 1},
//       ),
//     ).thenAnswer(
//       (_) async => Response(
//         requestOptions: RequestOptions(
//           headers: {"Content-Type": "Content-Type"},
//           queryParameters: {'limit': 10, 'page': 1},
//           baseUrl: 'https://api.thecatapi.com/v1/breeds',
//         ),
//         statusCode: 200,
//         data: [
//           {
//             "weight": {"imperial": "6 - 12", "metric": "3 - 7"},
//             "id": "beng",
//             "name": "Bengal",
//             "cfa_url": "http://cfa.org/Breeds/BreedsAB/Bengal.aspx",
//             "vetstreet_url": "http://www.vetstreet.com/cats/bengal",
//             "vcahospitals_url":
//                 "https://vcahospitals.com/know-your-pet/cat-breeds/bengal",
//             "temperament": "Alert, Agile, Energetic, Demanding, Intelligent",
//             "origin": "United States",
//             "country_codes": "US",
//             "country_code": "US",
//             "description":
//                 "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.",
//             "life_span": "12 - 15",
//             "indoor": 0,
//             "lap": 0,
//             "adaptability": 5,
//             "affection_level": 5,
//             "child_friendly": 4,
//             "cat_friendly": 4,
//             "dog_friendly": 5,
//             "energy_level": 5,
//             "grooming": 1,
//             "health_issues": 3,
//             "intelligence": 5,
//             "shedding_level": 3,
//             "social_needs": 5,
//             "stranger_friendly": 3,
//             "vocalisation": 5,
//             "bidability": 3,
//             "experimental": 0,
//             "hairless": 0,
//             "natural": 0,
//             "rare": 0,
//             "rex": 0,
//             "suppressed_tail": 0,
//             "short_legs": 0,
//             "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_(cat)",
//             "hypoallergenic": 1,
//             "reference_image_id": "O3btzLlsO",
//           },
//         ],
//       ),
//     );
//     final dd = await homeApiService.getBreeds();

//     expect(dd[0].id, "beng");
//   });

//   test("description", () async {
//     when(mockDio.fetch(any)).thenAnswer(
//       (_) async => Response(
//         requestOptions: RequestOptions(
//           path: '/breeds',
//           baseUrl: 'https://api.thecatapi.com/v1',
//         ),
//         statusCode: 200,
//         data: [
//           {
//             "weight": {"imperial": "6 - 12", "metric": "3 - 7"},
//             "id": "beng",
//             "name": "Bengal",
//             "cfa_url": "http://cfa.org/Breeds/BreedsAB/Bengal.aspx",
//             "vetstreet_url": "http://www.vetstreet.com/cats/bengal",
//             "vcahospitals_url":
//                 "https://vcahospitals.com/know-your-pet/cat-breeds/bengal",
//             "temperament": "Alert, Agile, Energetic, Demanding, Intelligent",
//             "origin": "United States",
//             "country_codes": "US",
//             "country_code": "US",
//             "description":
//                 "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.",
//             "life_span": "12 - 15",
//             "indoor": 0,
//             "lap": 0,
//             "adaptability": 5,
//             "affection_level": 5,
//             "child_friendly": 4,
//             "cat_friendly": 4,
//             "dog_friendly": 5,
//             "energy_level": 5,
//             "grooming": 1,
//             "health_issues": 3,
//             "intelligence": 5,
//             "shedding_level": 3,
//             "social_needs": 5,
//             "stranger_friendly": 3,
//             "vocalisation": 5,
//             "bidability": 3,
//             "experimental": 0,
//             "hairless": 0,
//             "natural": 0,
//             "rare": 0,
//             "rex": 0,
//             "suppressed_tail": 0,
//             "short_legs": 0,
//             "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_(cat)",
//             "hypoallergenic": 1,
//             "reference_image_id": "O3btzLlsO",
//           },
//         ],
//       ),
//     );
//     final dd = await homeApiService.getBreeds();

//     expect(dd[0].id, "beng");
//   });
// }

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_discovery_app/features/home/data/api/home_api_service.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';

import 'api_breed_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<HomeRepo>()])
void main() {
  late MockDio mockDio;
  late HomeApiService homeApiService;
  // late HomeCubit homeCubit;
  // late BreedUseCases breedUseCases;

  setUp(() {
    mockDio = MockDio();
    homeApiService = HomeApiService(mockDio);

    // breedUseCases = BreedUseCases(homeRepo: homeRepo);
    // homeCubit = HomeCubit(breedUseCases: breedUseCases);

    when(mockDio.options).thenReturn(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com/v1',
        headers: {'Content-Type': 'application/json'},
      ),
    );
  });
  test("description", () async {
    when(mockDio.fetch<List<dynamic>>(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: '/breeds',
          baseUrl: 'https://api.thecatapi.com/v1',
        ),
        statusCode: 200,
        data: [
          {
            "id": "beng",
            "name": "Bengal",
            "origin": "United States",
            "description": "Bengals are playful and active cats.",
            "temperament": "Alert, Agile, Energetic",
            "life_span": "12 - 15",
            "reference_image_id": "O3btzLlsO",
          },
        ],
      ),
    );
    homeApiService = HomeApiService(mockDio);
    final result = await homeApiService.getBreeds();
    expect(result.isEmpty, false);
    expect(result[0].id, "beng");
    expect(result[0].lifeSpan, "12 - 15");
  });
}
