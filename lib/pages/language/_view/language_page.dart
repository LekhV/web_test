import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/language_model/language_model.dart';
import 'package:task_list_app/service/language_service.dart';
import 'package:task_list_app/utils/localizations_extension.dart';

class LanguagePage extends ConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.localizations!.change_language),
        const SizedBox(height: 36),
        DropdownButton<LanguageModel>(
          value: ref.watch(localProvider),
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: AppStyle.darkBlue),
          underline: Container(
            height: 2,
            color: AppStyle.darkBlue,
          ),
          onChanged: (LanguageModel? value) {
            if (value != null) {
              ref.watch(localProvider.notifier).update((state) => value);
            }
          },
          items:
              list.map<DropdownMenuItem<LanguageModel>>((LanguageModel value) {
            return DropdownMenuItem<LanguageModel>(
              value: value,
              child: Text(value.title ?? ''),
            );
          }).toList(),
        ),
      ],
    );
  }
}
