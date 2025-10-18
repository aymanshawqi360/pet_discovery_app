import 'package:flutter/material.dart';
import 'package:pet_discovery_app/core/networking/favorites_manager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() {
    favorites = FavoritesManager().getFavorites();
    setState(() {});
  }

  void toggleFavorite(String id) async {
    await FavoritesManager().removeFavorite(id);
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        leading: SizedBox.shrink(),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorite items found"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                final imageUrl = item['image'] != null
                    ? 'https://cdn2.thecatapi.com/images/${item['image']}.jpg'
                    : 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg';

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  constraints: const BoxConstraints(maxHeight: 120),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 80,
                            minWidth: 10,
                          ),
                          color: const Color(0xFFE0F7FA),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.network(imageUrl, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// الاسم + زر الحذف
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['name'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await FavoritesManager().removeFavorite(
                                      item['id'],
                                    );
                                    loadFavorites();
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            /// id أو أي وصف إضافي
                            Text(
                              item['id'] ?? '',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 4),

                            /// موقع وهمي ثابت
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '1.6 km away',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
