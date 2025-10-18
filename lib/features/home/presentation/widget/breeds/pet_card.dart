import 'package:flutter/material.dart';
import 'package:pet_discovery_app/core/networking/favorites_manager.dart';
import 'package:pet_discovery_app/features/home/data/model/home_breed_molde.dart';

class PetCard extends StatefulWidget {
  final Breed breed;
  const PetCard({super.key, required this.breed});

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 120),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(maxHeight: 80, minWidth: 10),
              color: const Color(0xFFE0F7FA),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  widget.breed.referenceImageId != null
                      ? 'https://cdn2.thecatapi.com/images/${widget.breed.referenceImageId}.jpg'
                      : 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',

                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.breed.name ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool isFav = FavoritesManager().isFavorite(
                          widget.breed.id!,
                        );
                        if (isFav) {
                          await FavoritesManager().removeFavorite(
                            widget.breed.id!,
                          );
                        } else {
                          await FavoritesManager().addFavorite({
                            'id': widget.breed.id,
                            'name': widget.breed.name,
                            'image': widget.breed.referenceImageId,
                          });
                        }
                        setState(() {});
                      },
                      child: Icon(
                        FavoritesManager().isFavorite(widget.breed.id!)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: FavoritesManager().isFavorite(widget.breed.id!)
                            ? Colors.red
                            : Colors.teal,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),
                Text(
                  widget.breed.id ?? 'Female',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.breed.origin ?? "5 Months Old",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 4),

                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.red, size: 14),
                    SizedBox(width: 4),
                    Text('1.6 km away', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
