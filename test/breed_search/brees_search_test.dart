import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_discovery_app/core/error/api_resulte.dart';
import 'package:pet_discovery_app/features/home/data/api/home_api_service.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';
import 'package:pet_discovery_app/features/home/domain/repo/home_repo.dart';

import 'package:pet_discovery_app/features/home/domain/use_cases/breed_search_use_cases.dart';

import '../api_breed_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<HomeRepo>()])
void main() {
  late HomeApiService homeApiService;
  late MockDio mockDio;
  late MockHomeRepo homeRepo;
  late BreedSearchUseCases breedSearchUseCases;
  late Breed model;
  // late List<Breed> list;

  setUp(() {
    mockDio = MockDio();
    homeApiService = HomeApiService(mockDio);
    homeRepo = MockHomeRepo();
    breedSearchUseCases = BreedSearchUseCases(homeRepo: homeRepo);
    homeRepo = MockHomeRepo();

    when(mockDio.options).thenReturn(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com/v1',
        queryParameters: {'attach_image': '1', 'q': 'u'},
      ),
    );

    model = Breed(
      weight: Weight(imperial: "5 - 10", metric: "2 - 5"),
      id: "acur",
      name: "American Curl",
      cfaUrl: "http://cfa.org/Breeds/BreedsAB/AmericanCurl.aspx",
      vetstreetUrl: "http://www.vetstreet.com/cats/american-curl",
      vcahospitalsUrl:
          "https://vcahospitals.com/know-your-pet/cat-breeds/american-curl",
      temperament:
          "Affectionate, Curious, Intelligent, Interactive, Lively, Playful, Social",
      origin: "United States",
      countryCodes: "US",
      countryCode: "US",
      description:
          "Distinguished by truly unique ears that curl back in a graceful arc, offering an alert, perky, happily surprised expression, they cause people to break out into a big smile when viewing their first Curl. Curls are very people-oriented, faithful, affectionate soulmates, adjusting remarkably fast to other pets, children, and new situations.",
      lifeSpan: "12 - 16",
      indoor: 0,
      lap: 1,
      altNames: "",
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 4,
      dogFriendly: 5,
      energyLevel: 3,
      grooming: 2,
      healthIssues: 1,
      intelligence: 3,
      sheddingLevel: 3,
      socialNeeds: 3,
      strangerFriendly: 3,
      vocalisation: 3,
      experimental: 0,
      hairless: 0,
      natural: 0,
      rare: 0,
      rex: 0,
      suppressedTail: 0,
      shortLegs: 0,
      wikipediaUrl: "https://en.wikipedia.org/wiki/American_Curl",
      hypoallergenic: 0,
      referenceImageId: "xnsqonbjW",
      bidability: null,
    );
  });

  test("should return list of breeds from repo", () async {
    final breeds = [
      Breed(
        weight: Weight(imperial: "5 - 10", metric: "2 - 5"),
        id: "acur",
        name: "American Curl",
        cfaUrl: "http://cfa.org/Breeds/BreedsAB/AmericanCurl.aspx",
        vetstreetUrl: "http://www.vetstreet.com/cats/american-curl",
        vcahospitalsUrl:
            "https://vcahospitals.com/know-your-pet/cat-breeds/american-curl",
        temperament:
            "Affectionate, Curious, Intelligent, Interactive, Lively, Playful, Social",
        origin: "United States",
        countryCodes: "US",
        countryCode: "US",
        description:
            "Distinguished by truly unique ears that curl back in a graceful arc, offering an alert, perky, happily surprised expression, they cause people to break out into a big smile when viewing their first Curl. Curls are very people-oriented, faithful, affectionate soulmates, adjusting remarkably fast to other pets, children, and new situations.",
        lifeSpan: "12 - 16",
        indoor: 0,
        lap: 1,
        altNames: "",
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 5,
        energyLevel: 3,
        grooming: 2,
        healthIssues: 1,
        intelligence: 3,
        sheddingLevel: 3,
        socialNeeds: 3,
        strangerFriendly: 3,
        vocalisation: 3,
        experimental: 0,
        hairless: 0,
        natural: 0,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaUrl: "https://en.wikipedia.org/wiki/American_Curl",
        hypoallergenic: 0,
        referenceImageId: "xnsqonbjW",
        bidability: null,
      ),
    ];

    when(
      homeRepo.getDataSearch(q: "u", attchImage: 1),
    ).thenAnswer((_) async => ApiResulte.success(breeds));

    final result = await breedSearchUseCases.getDataSearch(
      q: "u",
      attchImage: 1,
    );

    expect(result, isA<ApiResulte<List<Breed>>>());
  });
  test("Test  [HomeApiService]", () async {
    when(mockDio.fetch<List<dynamic>>(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          baseUrl: 'https://api.thecatapi.com/v1',
          path: 'v1/breeds/search',
        ),
        statusCode: 200,
        data: [
          {
            "weight": {"imperial": "5 - 10", "metric": "2 - 5"},
            "id": "acur",
            "name": "American Curl",
            "cfa_url": "http://cfa.org/Breeds/BreedsAB/AmericanCurl.aspx",
            "vetstreet_url": "http://www.vetstreet.com/cats/american-curl",
            "vcahospitals_url":
                "https://vcahospitals.com/know-your-pet/cat-breeds/american-curl",
            "temperament":
                "Affectionate, Curious, Intelligent, Interactive, Lively, Playful, Social",
            "origin": "United States",
            "country_codes": "US",
            "country_code": "US",
            "description":
                "Distinguished by truly unique ears that curl back in a graceful arc, offering an alert, perky, happily surprised expression, they cause people to break out into a big smile when viewing their first Curl. Curls are very people-oriented, faithful, affectionate soulmates, adjusting remarkably fast to other pets, children, and new situations.",
            "life_span": "12 - 16",
            "indoor": 0,
            "lap": 1,
            "alt_names": "",
            "adaptability": 5,
            "affection_level": 5,
            "child_friendly": 4,
            "dog_friendly": 5,
            "energy_level": 3,
            "grooming": 2,
            "health_issues": 1,
            "intelligence": 3,
            "shedding_level": 3,
            "social_needs": 3,
            "stranger_friendly": 3,
            "vocalisation": 3,
            "experimental": 0,
            "hairless": 0,
            "natural": 0,
            "rare": 0,
            "rex": 0,
            "suppressed_tail": 0,
            "short_legs": 0,
            "wikipedia_url": "https://en.wikipedia.org/wiki/American_Curl",
            "hypoallergenic": 0,
            "reference_image_id": "xnsqonbjW",
          },
          {
            "weight": {"imperial": "8 - 16", "metric": "4 - 7"},
            "id": "amau",
            "name": "Arabian Mau",
            "vcahospitals_url": "",
            "temperament":
                "Affectionate, Agile, Curious, Independent, Playful, Loyal",
            "origin": "United Arab Emirates",
            "country_codes": "AE",
            "country_code": "AE",
            "description":
                "Arabian Mau cats are social and energetic. Due to their energy levels, these cats do best in homes where their owners will be able to provide them with plenty of playtime, attention and interaction from their owners. These kitties are friendly, intelligent, and adaptable, and will even get along well with other pets and children.",
            "life_span": "12 - 14",
            "indoor": 0,
            "alt_names": "Alley cat",
            "adaptability": 5,
            "affection_level": 5,
            "child_friendly": 4,
            "dog_friendly": 5,
            "energy_level": 4,
            "grooming": 1,
            "health_issues": 1,
            "intelligence": 3,
            "shedding_level": 1,
            "social_needs": 3,
            "stranger_friendly": 3,
            "vocalisation": 1,
            "experimental": 0,
            "hairless": 0,
            "natural": 1,
            "rare": 0,
            "rex": 0,
            "suppressed_tail": 0,
            "short_legs": 0,
            "wikipedia_url": "https://en.wikipedia.org/wiki/Arabian_Mau",
            "hypoallergenic": 0,
            "reference_image_id": "k71ULYfRr",
          },
        ],
      ),
    );
    final result = await homeApiService.getDataSearch("a", 1);
    expect(result[0].lap, 1);
    expect(result.length, 2);
    expect(result[0].referenceImageId, 'xnsqonbjW');
  });
}
