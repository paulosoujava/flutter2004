import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engineering/ex_09.dart';


abstract class Platform {
  Widget createWidget();
}

class PlatformIos implements Platform {
  @override
  Widget createWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('CupertinoButton'),
          CupertinoButton(
            child: const Text('CupertinoButton'),
            onPressed: () {
              print('Pressed');
            },
          ),
        ]
    );
  }
}

class PlatformAndroid implements Platform {
  @override
  Widget createWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('MaterialButton'),
          MaterialButton(
            child: const Text('MaterialButton'),
            onPressed: () {
              print('Pressed');
            },
          ),
        ]
    );
  }
}


enum PlatformTypes { android, ios }

class PlatformWidgetFactory implements Platform {
  final PlatformTypes platformTypes;

  PlatformWidgetFactory({required this.platformTypes});

  @override
  Widget createWidget() {
     switch(platformTypes) {
       case PlatformTypes.android:
         return PlatformAndroid().createWidget();
       case PlatformTypes.ios:
         return PlatformIos().createWidget();
     }
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        final container = PlatformWidgetFactory(
            platformTypes: PlatformTypes.ios
        ).createWidget();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            body: Center(
                child: Decorator()
            )
        )
    );
  }
}

