
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PlatformTypes { android, ios }

abstract class Platform {
  Widget createWidget();
}

class IosPlatform implements Platform {
  @override
  Widget createWidget() {
    return CupertinoButton(
      child: const Text('CupertinoButton'),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}

class AndroidPlatform implements Platform {
  @override
  Widget createWidget() {
    return MaterialButton(
        child: const Text('MaterialButton'),
        onPressed: () {
          print('Pressed');
        });
  }
}


main() {

    PlatformWidget(
      platformTypes: PlatformTypes.android
    ).createWidget();

}

class PlatformWidget {
  final PlatformTypes platformTypes;

  PlatformWidget({required this.platformTypes});

  Platform createWidget() {
     switch(platformTypes) {
       case PlatformTypes.android:
         return AndroidPlatform();
       case PlatformTypes.ios:
         return IosPlatform();
     }
  }
}