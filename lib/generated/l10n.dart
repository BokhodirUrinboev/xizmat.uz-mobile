// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Онлайновая регистрация`
  String get online_reg {
    return Intl.message(
      'Онлайновая регистрация',
      name: 'online_reg',
      desc: '',
      args: [],
    );
  }

  /// `Основные данные`
  String get basic_data {
    return Intl.message(
      'Основные данные',
      name: 'basic_data',
      desc: '',
      args: [],
    );
  }

  /// `Семья`
  String get family {
    return Intl.message(
      'Семья',
      name: 'family',
      desc: '',
      args: [],
    );
  }

  /// `Тарифы`
  String get tariff {
    return Intl.message(
      'Тарифы',
      name: 'tariff',
      desc: '',
      args: [],
    );
  }

  /// `Титул`
  String get tile {
    return Intl.message(
      'Титул',
      name: 'tile',
      desc: '',
      args: [],
    );
  }

  /// `Форма обращения`
  String get application_form {
    return Intl.message(
      'Форма обращения',
      name: 'application_form',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get surname {
    return Intl.message(
      'Фамилия',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get email {
    return Intl.message(
      'Электронная почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `повторный пароль`
  String get repeated_password {
    return Intl.message(
      'повторный пароль',
      name: 'repeated_password',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные имена`
  String get additional_names {
    return Intl.message(
      'Дополнительные имена',
      name: 'additional_names',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get gender {
    return Intl.message(
      'Пол',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Мужской`
  String get male {
    return Intl.message(
      'Мужской',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Женский`
  String get female {
    return Intl.message(
      'Женский',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get phone {
    return Intl.message(
      'Телефон',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Личные данные`
  String get personal_data {
    return Intl.message(
      'Личные данные',
      name: 'personal_data',
      desc: '',
      args: [],
    );
  }

  /// `Адресные данные`
  String get address_data {
    return Intl.message(
      'Адресные данные',
      name: 'address_data',
      desc: '',
      args: [],
    );
  }

  /// `с/о (опционально)`
  String get s_o_optional {
    return Intl.message(
      'с/о (опционально)',
      name: 's_o_optional',
      desc: '',
      args: [],
    );
  }

  /// `Улица и номер`
  String get street_and_number {
    return Intl.message(
      'Улица и номер',
      name: 'street_and_number',
      desc: '',
      args: [],
    );
  }

  /// `2-я строка - улица и дом (опционально)`
  String get street_and_hause {
    return Intl.message(
      '2-я строка - улица и дом (опционально)',
      name: 'street_and_hause',
      desc: '',
      args: [],
    );
  }

  /// `Почтовый индекс`
  String get pascode {
    return Intl.message(
      'Почтовый индекс',
      name: 'pascode',
      desc: '',
      args: [],
    );
  }

  /// `Город`
  String get town {
    return Intl.message(
      'Город',
      name: 'town',
      desc: '',
      args: [],
    );
  }

  /// `Страна`
  String get country {
    return Intl.message(
      'Страна',
      name: 'country',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
