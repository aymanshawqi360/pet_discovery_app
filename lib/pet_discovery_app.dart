import 'package:flutter/material.dart';
import 'package:pet_discovery_app/core/routing/app_route.dart';
import 'package:pet_discovery_app/core/routing/routes.dart';

class PetDiscoveryApp extends StatelessWidget {
  final AppRouting appRouting;
  const PetDiscoveryApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.navigatorExample,
      onGenerateRoute: appRouting.onGenerateRoute,
    );
  }
}
