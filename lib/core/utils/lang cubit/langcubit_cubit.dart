
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../language cache helper.dart';
import '../shared _pref.dart';
import 'langcubit_state.dart';



class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('ar')));

  static LocaleCubit get(context) => BlocProvider.of(context);

  String? load;
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
    await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
    load = cachedLanguageCode;
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
    print('success lang $languageCode');
    PreferenceUtils.setString(SharedKeys.language, languageCode);
  }


}