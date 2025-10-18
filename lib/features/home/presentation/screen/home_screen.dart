import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_discovery_app/core/di/dependency_injection.dart';
import 'package:pet_discovery_app/core/routing/routes.dart';
import 'package:pet_discovery_app/core/widgets/app_text_form_field.dart';
import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:pet_discovery_app/features/home/presentation/screen/search_screen.dart';
import 'package:pet_discovery_app/features/home/presentation/widget/breeds/pet_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getBreedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 74, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Find Your Forever Pet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (context) => sl<HomeCubit>(),
                        child: SearchScreen(),
                      ),
                    ),
                  ),
                  //  Navigator.pushNamed(context, Routes.search),
                  child: Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: AppTextFormField(
            //       filled: true,

            //       suffixIcon: Icon(Icons.tune, color: Colors.black),
            //       prefixIcon: GestureDetector(
            //         onTap: () => Navigator.pushNamed(context, Routes.search),
            //         child: Icon(Icons.search, color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    log(state.homeBreed[0].referenceImageId.toString());
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: state.homeBreed.length,
                      itemBuilder: (context, index) {
                        return PetCard(breed: state.homeBreed[index]);
                        //  Image.network(
                        //   "https://cdn2.thecatapi.com/images/${state.homeBreed[index].referenceImageId}.jpg",
                        // );
                      },
                    );
                  } else if (state is HomeFailure) {
                    return Text("Failure");
                  } else {
                    return Text("loading");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
