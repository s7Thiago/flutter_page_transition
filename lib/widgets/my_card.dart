import 'package:flutter/material.dart';

import 'tool_box.dart' as utils;

class MyCard extends StatelessWidget {
  final String title;
  final String content;
  final BoxDecoration? style;

  const MyCard({
    Key? key,
    this.title = 'title',
    this.content = 'content',
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10),
        decoration: style ?? utils.Styles.containers['decoration2'],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.title, style: utils.Styles.texts['s1']),
              SizedBox(height: 20),
              Text(this.content, style: utils.Styles.texts['s2']),
            ],
          ),
        ),
      ),
    );
  }
}
