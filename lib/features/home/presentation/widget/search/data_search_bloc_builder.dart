import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_discovery_app/core/widgets/app_list_view.dart';
import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:pet_discovery_app/features/home/presentation/widget/search/data_search_view.dart';

class DataSearchBlocBuilder extends StatelessWidget {
  const DataSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeDataSearchLoading ||
          current is HomeDataSearchFailure ||
          current is HomeDataSearchSuccess,
      builder: (context, state) {
        if (state is HomeDataSearchLoading) {
          return buildLoadingState();
        } else if (state is HomeDataSearchSuccess) {
          return buildSuccessState(state: state);
        } else if (state is HomeDataSearchFailure) {
          return buildFailureState();
        } else {
          return Center(child: Text("No results yet, start searching!"));
        }
      },
    );
  }

  Widget buildLoadingState() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildSuccessState({required HomeDataSearchSuccess state}) {
    return AppListView(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DataSearchView(breed: state.dataSearch[index]),
        );
      },
      itemCount: state.dataSearch.length,
    );
  }

  Widget buildFailureState() {
    return Center(child: Text("Error"));
  }
}
