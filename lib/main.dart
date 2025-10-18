import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_discovery_app/core/di/dependency_injection.dart';
import 'package:pet_discovery_app/core/networking/favorites_manager.dart';
import 'package:pet_discovery_app/core/routing/app_route.dart';
import 'package:pet_discovery_app/pet_discovery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  await Hive.initFlutter();
  await FavoritesManager().init();
  runApp(PetDiscoveryApp(appRouting: AppRouting()));
}
