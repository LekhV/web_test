import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_list_app/app_navigation_bar.dart';

extension LocalizationsExtension on BuildContext {
  AppLocalizations? get localizations {
    return AppLocalizations.of(this);
  }

  Locale get locale {
    return Localizations.localeOf(this);
  }
}

extension NavigationBarLabelX on NavigationBarLabel {
  String title(BuildContext context) {
    switch (this) {
      case NavigationBarLabel.tasks:
        return context.localizations!.tasks;

      case NavigationBarLabel.projects:
        return context.localizations!.projects;

      case NavigationBarLabel.teams:
        return context.localizations!.teams;

      case NavigationBarLabel.language:
        return context.localizations!.language;
    }
  }
}
