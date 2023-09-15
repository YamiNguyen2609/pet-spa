import 'package:flutter/material.dart';

class AppListView<T> extends StatelessWidget {
  final List<T> data;
  final int? length;
  final Function child;
  final double height;
  const AppListView(
      {super.key,
      required this.data,
      this.length,
      this.height = 0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: height > 0 ? height : (length ?? data.length) * 50),
        child: ListView.builder(
          itemCount: length ?? data.length,
          itemBuilder: (BuildContext context, int index) {
            T item = data[index];
            return child(context, item, index);
          },
        ));
  }
}
