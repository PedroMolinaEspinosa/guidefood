import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setScreensControls() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Size getMediaSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

EdgeInsets getMediaPadding(BuildContext context) {
  return MediaQuery.of(context).padding;
}
