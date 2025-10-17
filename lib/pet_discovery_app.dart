import 'package:flutter/material.dart';
import 'package:pet_discovery_app/core/routing/app_route.dart';

class PetDiscoveryApp extends StatelessWidget {
  final AppRouting appRouting;
  const PetDiscoveryApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.onGenerateRoute,
    );
  }
}
