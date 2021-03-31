import 'package:flutter/material.dart';

import 'tool_box.dart' as utils;

class HealthCategory extends StatelessWidget {
  final String name;

  const HealthCategory({this.name = 'Activity'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1.0),
      width: double.infinity,
      decoration: utils.Styles.containers['decoration4'],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            decoration: utils.Styles.containers['container5'],
            child: Text(
              this.name,
              style: utils.Styles.texts['d2'],
            ),
          ),
        ],
      ),
    );
  }
}
