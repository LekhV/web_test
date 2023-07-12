import 'package:flutter/material.dart';
import 'package:task_list_app/utils/localizations_extension.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.localizations!.teams),
    );
  }
}
