// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pet_discovery_app/core/widgets/app_list_view.dart';
// import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';

// class BreedBlocBuilder extends StatelessWidget {
//   const BreedBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       buildWhen: (previous, current) =>
//           current is HomeLoading ||
//           current is HomeFailure ||
//           current is HomeSuccess,
//       builder: (context, state) {
//         if (state is HomeLoading) {
//           return buildLoadingState();
//         } else if (state is HomeSuccess) {
//           return buildSuccessState();
//         } else if (state is HomeFailure) {
//           return buildFailureState();
//         } else {
//           return Center(child: Text("ErrorDefault"));
//         }
//       },
//     );
//   }


//   Widget buildSuccessState(){
//     return  AppListView(itemBuilder: (context,index){
//       return 
//     }, itemCount: 85);
//   }
// }
