import 'dart:async';

import 'package:common_classes/common_classes.dart';
import 'package:logger/logger.dart';
import 'package:share_client/src/share_client.dart';
import 'package:share_client/src/share_failure.dart';
import 'package:share_plus/share_plus.dart';

/// [ShareClientImpl] is an implementation of [ShareClient]
///
/// [logger] is the logger. If not null, it will be used to log
///
/// [telemetryOnError] is the telemetry function to be called when an error occurs
///
/// [telemetryOnSuccess] is the telemetry function to be called when success
///
class ShareClientImpl implements ShareClient {
  final Logger? _logger;

  final FutureOr<void> Function(Failure)? _telemetryOnError;

  final FutureOr<void> Function()? _telemetryOnSuccess;

  ShareClientImpl({
    Logger? logger,
    FutureOr<void> Function(Failure)? telemetryOnError,
    FutureOr<void> Function()? telemetryOnSuccess,
  })  : _logger = logger,
        _telemetryOnError = telemetryOnError,
        _telemetryOnSuccess = telemetryOnSuccess;

  @override
  Future<Result<void>> shareFile(String path) {
    _logger?.d('[START] sharing file $path');

    return Result.asyncGuard(
      () async {
        await Share.shareFiles([path]);

        _logger?.d('[SUCCESS] file $path shared');

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotShareFailure(
          content: path,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] sharing file $path',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> shareFiles(List<String> paths) {
    _logger?.d('[START] sharing files $paths');

    return Result.asyncGuard(
      () async {
        await Share.shareFiles(paths);

        _logger?.d('[SUCCESS] files $paths shared');

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotShareFailure(
          content: paths.toString(),
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] sharing files $paths',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> shareText(String text) {
    _logger?.d('[START] sharing text $text');

    return Result.asyncGuard(
      () async {
        await Share.share(text);

        _logger?.d('[SUCCESS] text $text shared');

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotShareFailure(
          content: text,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] sharing text $text',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }
}
