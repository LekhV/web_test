import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/utils/localizations_extension.dart';

import 'scopes/app_router.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final NavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        item.url == AppRouteKeys.tasksPageUrl
            ? context.goNamed(
                '${item.url}',
                pathParameters: {'id': '1'},
              )
            : context.goNamed('${item.url}');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          item.name.title(context),
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

enum NavigationBarLabel { tasks, projects, teams, language }

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(
    name: NavigationBarLabel.tasks,
    url: AppRouteKeys.tasksPageUrl,
  ),
  NavigationBarItem(
    name: NavigationBarLabel.projects,
    url: AppRouteKeys.projectsPageUrl,
  ),
  NavigationBarItem(
    name: NavigationBarLabel.teams,
    url: AppRouteKeys.teamsPageUrl,
  ),
  NavigationBarItem(
    name: NavigationBarLabel.language,
    url: AppRouteKeys.languagePageUrl,
  ),
];

class NavigationBarItem {
  final NavigationBarLabel name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
