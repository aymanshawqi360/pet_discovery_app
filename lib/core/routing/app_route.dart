import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_discovery_app/core/di/dependency_injection.dart';

import 'package:pet_discovery_app/core/routing/routes.dart';
import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:pet_discovery_app/features/home/presentation/screen/home_screen.dart';
import 'package:pet_discovery_app/features/home/presentation/screen/search_screen.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.search:
        return MaterialPageRoute(
          builder: (context) {
            return SearchScreen();
          },
        );

      default:
        return defaultPage();
    }
  }

  MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
