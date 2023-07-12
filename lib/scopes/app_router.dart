import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/language/_view/language_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';

import 'package:task_list_app/pages/teams/_view/teams_page.dart';

abstract class AppRouteKeys {
  static const String tasksPageUrl = '/tasks';
  static const String projectsPageUrl = '/projects';
  static const String teamsPageUrl = '/teams';
  static const String languagePageUrl = '/language';
}

final GoRouter router = GoRouter(
  initialLocation: '/tasks/1',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          name: AppRouteKeys.tasksPageUrl,
          path: AppRouteKeys.tasksPageUrl + '/:id',
          builder: (context, state) {
            return TasksPage(
              taskId: state.pathParameters['id'],
            );
          },
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: TasksPage(
              taskId: state.pathParameters['id'],
            ),
          ),
        ),
        GoRoute(
          name: AppRouteKeys.projectsPageUrl,
          path: AppRouteKeys.projectsPageUrl,
          builder: (BuildContext context, GoRouterState state) {
            return const ProjectsPage();
          },
        ),
        GoRoute(
          name: AppRouteKeys.teamsPageUrl,
          path: AppRouteKeys.teamsPageUrl,
          builder: (BuildContext context, GoRouterState state) {
            return const TeamsPage();
          },
        ),
        GoRoute(
          name: AppRouteKeys.languagePageUrl,
          path: AppRouteKeys.languagePageUrl,
          builder: (BuildContext context, GoRouterState state) {
            return const LanguagePage();
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
