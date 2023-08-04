import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  var items;
  final Duration animationDuration;
  final Function onTap;

  Animated(
      {this.items,
        this.animationDuration = const Duration(milliseconds: 300),
        required this.onTap});

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late double height = 200, width = 200;

  @override
  Widget build(BuildContext context) {
    /* height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;*/
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> _Items = [];
    for (int i = 0; i < widget.items.length; i++) {
      bool isSelected = selectedIndex == i;
      _Items.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedIndex = i;
              widget.onTap(selectedIndex);
            });
          },
          child: AnimatedContainer(
            width: isSelected == true ? width + 60 : width,
            margin: EdgeInsets.only(left: 2, right: 2),
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.primaries[Random().nextInt(Colors.primaries.length)]
                ],
              ),
            ),
            child: Text(widget.items[i.toString()]),
          ),
        ),
      );
    }
    return _Items;
  }
}