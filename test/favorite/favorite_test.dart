import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:pet_discovery_app/core/networking/favorites_manager.dart';

void main() {
  late FavoritesManager favoritesManager;
  late Map<String, dynamic> favorites;
  late Box box;

  setUpAll(() async {
    final testDir = Directory('./test/hive_test_dir');
    Hive.init(testDir.path);
  });

  setUp(() async {
    favoritesManager = FavoritesManager();
    await favoritesManager.init();

    final box = Hive.box(FavoritesManager.boxName);
    await box.clear();

    favorites = {
      'id': 'abys',
      'name': 'Abyssinian',
      'image': 'https://cdn2.thecatapi.com/images/0XYvRd7oD',
    };
  });

  test("test favorite", () async {
    await favoritesManager.addFavorite(favorites);

    final getData = favoritesManager.getFavorites();
    expect(getData.length, 1);
    expect(getData.first['id'], 'abys');
    expect(getData.first['name'], 'Abyssinian');
  });

  test("remove favorite", () async {
    await favoritesManager.addFavorite(favorites);
    await favoritesManager.removeFavorite("abys");

    final getData = favoritesManager.getFavorites();
    expect(getData.length, 0);
  });
}
