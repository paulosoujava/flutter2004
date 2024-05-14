

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


class AppLifecycleListener with WidgetsBindingObserver, Diagnosticable{

  final VoidCallback onResume;
  final VoidCallback onInactive;
  final VoidCallback onPaused;
  final VoidCallback onDetached;
  final VoidCallback onStateChange;

  AppLifecycleListener({
    required this.onResume,
    required this.onInactive,
    required this.onPaused,
    required this.onDetached,
    required this.onStateChange
  });
}

class MyLifecycleWatcher extends StatefulWidget {
  const MyLifecycleWatcher({super.key});

  @override
  createState() => MyLifecycleWatcherState();
}

class MyLifecycleWatcherState extends State<MyLifecycleWatcher>
    with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      print('AppLifecycleState resumed');
    } else if(state == AppLifecycleState.inactive) {
      print('AppLifecycleState inactive');
    } else if(state == AppLifecycleState.paused) {
      print('AppLifecycleState paused');
    } else if(state == AppLifecycleState.detached) {
      print('AppLifecycleState detached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyLClistener extends StatefulWidget {
  const MyLClistener({super.key});

 @override
  createState()=> MyLifecycleWatcherState();
}

class MyLifecycleListenerState extends State<MyLClistener>{
   late final AppLifecycleListener _appLifecycleListener;

  @override
  void initState() {
    super.initState();
    _appLifecycleListener = AppLifecycleListener(
      onStateChange: _onStateChange,
      onResume:  _onResume,
      onInactive: _onInactive,
      onPaused: _onPaused,
      onDetached: _onDetached
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onStateChange() {
    print('onStateChange');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _onResume() {
    print('onResume');
  }

  void _onInactive() {
    print('onInactive');
  }

  void _onPaused() {
    print('onPaused');
  }

  void _onDetached() {
    print('onDetached');
  }
}