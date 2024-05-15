//PROXY
import 'package:flutter/material.dart';

abstract class AccessibleWidget {
  Widget build(BuildContext context);//token expirado, acesso negado, ou SUCCESSS
}

//real widget
class RestrictedContentWidget extends AccessibleWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Restricted content',
      key: Key('restrictedContentKey'),
    );
  }
}

//Proxy
class AccessControlProxyWidget extends AccessibleWidget {
  final AccessibleWidget protectedWidget;
  AccessControlProxyWidget(
      {required this.protectedWidget});

  @override
  Widget build(BuildContext context) {
    return _checkUSerAccess()
        ? protectedWidget.build(context)
        : const Text('Access Denied');
  }

  bool _checkUSerAccess() => true;
}



void main() {
  runApp(const MaterialApp(
      home: Scaffold(
          body: MyProxy())));
}

class MyProxy extends StatelessWidget {
  const MyProxy({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessControlProxyWidget(
      protectedWidget: RestrictedContentWidget(),
    ).build(context);
  }
}
