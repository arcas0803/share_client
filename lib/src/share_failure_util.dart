import 'package:flutter/widgets.dart';
import 'package:share_client/localization/share_localizations.dart';
import 'package:share_client/src/share_failure.dart';

class ShareFailureUtil {
  static String getFailureNameUI({
    required BuildContext context,
    required ShareFailure failure,
  }) {
    return ShareLocalizations.of(context)!.canNotShare;
  }
}
