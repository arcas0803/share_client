import 'package:common_classes/common_classes.dart';

sealed class ShareFailure extends Failure {
  ShareFailure(
      {required super.message,
      required super.error,
      required super.stackTrace});
}

final class CanNotShareFailure extends ShareFailure {
  CanNotShareFailure({
    required String content,
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Can not share $content',
          error: error,
          stackTrace: stackTrace,
        );
}
