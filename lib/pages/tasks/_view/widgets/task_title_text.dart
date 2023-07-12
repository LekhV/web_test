import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskTitleText extends StatelessWidget {
  final String title;
  final String id;
  final String selectedId;

  const TaskTitleText({
    Key? key,
    required this.title,
    required this.id,
    required this.selectedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: id == selectedId ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}
