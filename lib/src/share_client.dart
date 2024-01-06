import 'package:common_classes/common_classes.dart';

import 'share_failure.dart';

/// [ShareClient] is an interface for access share client
///
abstract class ShareClient {
  /// Share text
  ///
  /// [text] is the text to share
  ///
  /// Returns [Result] with [void] if success
  ///
  /// Throws [CanNotShareFailure] if can not share
  ///
  Future<Result<void>> shareText(String text);

  /// Share file
  ///
  /// [path] is the path of the file to share
  ///
  /// Returns [Result] with [void] if success
  ///
  /// Throws [CanNotShareFailure] if can not share
  ///
  Future<Result<void>> shareFile(String path);

  /// Share files
  ///
  /// [paths] is the paths of the files to share
  ///
  /// Returns [Result] with [void] if success
  ///
  /// Throws [CanNotShareFailure] if can not share
  ///
  Future<Result<void>> shareFiles(List<String> paths);
}
