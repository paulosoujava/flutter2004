//Composite

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//abstract class for all menu items [leaft and cpmposite]

abstract interface class MenuItem implements Widget {
  //all menu should open onTalp
  void expand(bool expanded);
}

//Leaf node
class SimpleMenuItem extends StatelessWidget implements MenuItem {
  final Function() action;
  final String title;

  const SimpleMenuItem({super.key, required this.action, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), onTap: action);
  }

  @override
  void expand(_) {
    //Leaf node, do nothing
  }
}

//Composite node that can contain other menu items
class Submenu extends StatefulWidget implements MenuItem {
  final String title;
  final List<MenuItem> children;
  final bool expandedAll;
  bool childenExpanded = false;

  Submenu(
      {super.key,
      required this.title,
      required this.children,
      required this.expandedAll});

  @override
  void expand(bool expanded) {
    childenExpanded = expanded;
    for (final child in children) {
      child.expand(expanded);
    }
  }

  @override
  SubmenuState createState() => SubmenuState();
}

class SubmenuState extends State<Submenu> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      initiallyExpanded: widget.expandedAll,
      children: widget.children,
    );
  }
}


//Usage
class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SimpleMenuItem(action: () {}, title: 'Item 1'),
      Submenu(
        title: 'Submenu 1',
        expandedAll: true,
        children: [
          SimpleMenuItem(action: () {}, title: 'Item 1.1'),
          SimpleMenuItem(action: () {}, title: 'Item 1.2'),
          SimpleMenuItem(action: () {}, title: 'Item 1.3'),
        ],
      ),
      SimpleMenuItem(action: () {}, title: 'Item 2'),
      Submenu(title: 'Submenu 2', expandedAll: false, children: [
        SimpleMenuItem(action: () {}, title: 'Item 2.1'),
        SimpleMenuItem(action: () {}, title: 'Item 2.2'),
        SimpleMenuItem(action: () {}, title: 'Item 2.3'),
      ]),
      SimpleMenuItem(action: () {}, title: 'Item 3'),
    ]);
  }
}
