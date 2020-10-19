import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInteractor {

  launchUrl(final String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } on PlatformException catch (ex, stackTrace) {
      // TODO log to crashlytics
    }
  }

}