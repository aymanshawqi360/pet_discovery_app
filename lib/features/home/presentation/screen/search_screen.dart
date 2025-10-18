import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_discovery_app/core/widgets/app_text_form_field.dart';
import 'package:pet_discovery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:pet_discovery_app/features/home/presentation/widget/search/data_search_bloc_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late TextEditingController textEditingController;
  // @override
  // void initState() {
  //   textEditingController = context.read<HomeCubit>().textEditingController;
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   textEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Color(0xffE1F8F9)),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppTextFormField(
                filled: true,

                suffixIcon: Icon(Icons.tune, color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),

                //   controller: textEditingController,
                onChanged: (value) {
                  context.read<HomeCubit>().getDataSearchState(
                    attchImage: 1,
                    search: value,
                  );
                },
              ),
            ),
          ),
          Expanded(child: DataSearchBlocBuilder()),
        ],
      ),
    );
  }
}
