import 'package:flutter/widgets.dart';
import 'package:football/l10n/l10n.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
