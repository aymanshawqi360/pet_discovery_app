import 'package:hive/hive.dart';

class FavoritesManager {
  static const String boxName = 'favoritesBox';
  static const String keyFavoritesList = 'favoritesList';

  late Box box;
  Box get _box => Hive.box(boxName);

  FavoritesManager._privateConstructor();

  static final FavoritesManager _instance =
      FavoritesManager._privateConstructor();

  factory FavoritesManager() {
    return _instance;
  }

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      box = await Hive.openBox(boxName);
    } else {
      box = Hive.box(boxName);
    }
  }

  //!Get
  List<Map<String, dynamic>> getFavorites() {
    final list = box.get(
      keyFavoritesList,
      defaultValue: <Map<dynamic, dynamic>>[],
    );

    return (list as List)
        .map((item) => Map<String, dynamic>.from(item))
        .toList();
  }

  //!check if favorite
  bool isFavorite(String id) {
    final favorites = getFavorites();
    return favorites.any((item) => item['id'] == id);
  }

  //!add favorite
  Future<void> addFavorite(Map<String, dynamic> item) async {
    final favorites = getFavorites();
    bool exists = favorites.any((element) => element['id'] == item['id']);
    if (!exists) {
      favorites.add(item);
      await box.put(keyFavoritesList, favorites);
    }
  }

  //!remove favorite
  Future<void> removeFavorite(String id) async {
    final favorites = getFavorites();
    favorites.removeWhere((item) => item['id'] == id);
    await box.put(keyFavoritesList, favorites);
  }
}
