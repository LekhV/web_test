import 'package:flutter/material.dart';
import 'package:task_list_app/utils/localizations_extension.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.localizations!.projects),
    );
  }
}
