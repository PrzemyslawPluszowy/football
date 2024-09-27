import 'dart:async';

import 'package:football/bootstrap.dart';
import 'package:football/core/di/di.dart';
import 'package:football/features/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

late final Talker talker;
void main() {
  talker = TalkerFlutter.init();
  setupLocator();
  runZonedGuarded(
    () => bootstrap(App.new),
    (Object error, StackTrace stack) {
      talker.handle(error, stack, 'Uncaught app exception');
    },
  );
}
