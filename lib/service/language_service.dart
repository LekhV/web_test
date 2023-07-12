import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/language_model/language_model.dart';

final localProvider = StateProvider<LanguageModel>((ref) {
  return LanguageModel(title: 'English', code: 'en');
});

const List<LanguageModel> list = <LanguageModel>[
  LanguageModel(title: 'English', code: 'en'),
  LanguageModel(title: 'عربي', code: 'es')
];
