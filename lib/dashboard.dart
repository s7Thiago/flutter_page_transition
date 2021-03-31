import 'package:flutter/material.dart';

import 'widgets/tool_box.dart' as utils;
import 'widgets/my_card.dart';
import 'widgets/h_category.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/one.jpg'),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Today', style: utils.Styles.texts['d1']),
                SizedBox(height: 20),
                Row(
                  children: [
                    MyCard(title: 'Steps', content: '3 3500'),
                    MyCard(
                      title: 'Sports',
                      content: '25 min',
                      style: utils.Styles.containers['decoration3'],
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Text('Health Categories', style: utils.Styles.texts['d1']),
                SizedBox(height: 40.0),
                HealthCategory(),
                HealthCategory(),
                HealthCategory(),
                HealthCategory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
