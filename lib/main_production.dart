import 'package:football/bootstrap.dart';
import 'package:football/core/di/di.dart';
import 'package:football/features/app/app.dart';

void main() {
  setupLocator();

  bootstrap(App.new);
}
