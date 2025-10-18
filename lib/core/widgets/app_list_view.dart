import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  // final Widget Function(BuildContext, int) separatorBuilder;
  final int itemCount;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  const AppListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.scrollDirection,
    this.shrinkWrap,
    // required this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // scrollDirection: scrollDirection ?? Axis.horizontal,
      // shrinkWrap: shrinkWrap ?? false,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      //    separatorBuilder: separatorBuilder,
    );
  }
}
