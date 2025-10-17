import 'package:demo002/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
