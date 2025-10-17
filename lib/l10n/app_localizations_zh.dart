// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '我的應用';

  @override
  String get welcomeMessage => '歡迎！';

  @override
  String helloUser(Object username) {
    return '你好，$username！';
  }

  @override
  String get entryName => '輸入名字';
}
