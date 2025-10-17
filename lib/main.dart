import 'package:flutter/material.dart';
import 'package:pet_discovery_app/core/di/dependency_injection.dart';
import 'package:pet_discovery_app/core/routing/app_route.dart';
import 'package:pet_discovery_app/pet_discovery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  runApp(PetDiscoveryApp(appRouting: AppRouting()));
}
