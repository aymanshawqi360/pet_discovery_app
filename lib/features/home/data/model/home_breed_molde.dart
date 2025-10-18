import 'package:json_annotation/json_annotation.dart';

part 'home_breed_molde.g.dart';

@JsonSerializable()
class HomeBreedMolde {
  List<Breed>? breeds;
  HomeBreedMolde({this.breeds});
  factory HomeBreedMolde.fromJosn(Map<String, dynamic> json) =>
      _$HomeBreedMoldeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBreedMoldeToJson(this);
}

@JsonSerializable()
class Breed {
  final Weight? weight;
  final String? id;
  final String? name;
  @JsonKey(name: "cfa_url")
  final String? cfaUrl;
  @JsonKey(name: "vetstreet_url")
  final String? vetstreetUrl;
  @JsonKey(name: "vcahospitals_url")
  final String? vcahospitalsUrl;
  final String? temperament;
  final String? origin;
  @JsonKey(name: "country_codes")
  final String? countryCodes;
  @JsonKey(name: "country_code")
  final String? countryCode;

  final String? description;
  @JsonKey(name: "life_span")
  final String? lifeSpan;

  final int? indoor;

  final int? lap;
  @JsonKey(name: "alt_names")
  final String? altNames;
  final int? adaptability;
  @JsonKey(name: "affection_level")
  final int? affectionLevel;
  @JsonKey(name: "child_friendly")
  final int? childFriendly;
  @JsonKey(name: "dog_friendly")
  final int? dogFriendly;
  @JsonKey(name: "energy_level")
  final int? energyLevel;

  final int? grooming;
  @JsonKey(name: "health_issues")
  final int? healthIssues;

  final int? intelligence;
  @JsonKey(name: "shedding_level")
  final int? sheddingLevel;
  @JsonKey(name: "social_needs")
  final int? socialNeeds;
  @JsonKey(name: "stranger_friendly")
  final int? strangerFriendly;

  final int? vocalisation;
  final int? bidability;

  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  @JsonKey(name: "suppressed_tail")
  final int? suppressedTail;
  final int? shortLegs;
  @JsonKey(name: "wikipedia_url")
  final String? wikipediaUrl;
  final int? hypoallergenic;
  @JsonKey(name: "reference_image_id")
  final String? referenceImageId;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}

@JsonSerializable()
class Weight {
  final String? imperial;
  final String? metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
