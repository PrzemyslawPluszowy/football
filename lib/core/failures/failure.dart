import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football/l10n/l10n.dart';
import 'package:talker_flutter/talker_flutter.dart';

sealed class Failure {
  Failure({this.e, this.s});
  final String? e;
  final StackTrace? s;
}

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure({String? e, StackTrace? s}) : super(e: e, s: s) {
    Talker().warning(e, s);
  }
  @override
  List<Object?> get props => [e, s];
  @override
  bool? get stringify => true;
}

class NotFoundFailure extends Failure with EquatableMixin {
  NotFoundFailure({String? e, StackTrace? s}) : super(e: e, s: s) {
    Talker().warning(e, s);
  }

  @override
  List<Object?> get props => [e, s];

  @override
  bool? get stringify => true;
}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({String? e, StackTrace? s}) : super(e: e, s: s) {
    Talker().error(e, s);
  }
  @override
  List<Object?> get props => [e, s];

  @override
  bool? get stringify => true;
}

class UnknownFailure extends Failure with EquatableMixin {
  UnknownFailure({String? e, StackTrace? s}) : super(e: e, s: s) {
    Talker().error(e, s);
  }

  @override
  List<Object?> get props => [e, s];
  @override
  bool? get stringify => true;
}

class FailureTranslate {
  static String mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure) {
      case NetworkFailure():
        return context.l10n.networkError;
      case NotFoundFailure():
        return context.l10n.notFoundError;
      case ServerFailure():
        return context.l10n.serverError;
      case UnknownFailure():
        return context.l10n.unknownError;
      default:
        return context.l10n.unknownError;
    }
  }
}
