import 'package:flutter/material.dart';

_container() => Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );

class Ex04 extends StatelessWidget {
  const Ex04({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 240,
            minHeight: 100,
          ),
          child: _container(),
        ),
        Row(children: [
          Expanded(child: _container(), flex: 1,),
          const Spacer(flex: 1,),
          Expanded(child: _container(), flex: 2,),
        ]),
      ],
    );
  }
}
