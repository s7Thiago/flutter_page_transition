import 'package:flutter/material.dart';
import 'tool_box.dart' as utils;

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/one.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.3),
                    Colors.black.withOpacity(.3),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.0),
                    Text('Exercise 1', style: utils.Styles.texts['h1']),
                    SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '15',
                          style: utils.Styles.texts['h1']!
                              .copyWith(color: Colors.yellow[400]),
                        ),
                        Text(
                          'Minutes',
                          style: utils.Styles.texts['h1']!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3',
                          style: utils.Styles.texts['h1']!
                              .copyWith(color: Colors.yellow[400]),
                        ),
                        Text(
                          'Exercises',
                          style: utils.Styles.texts['h1']!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 180.0),
                    Align(
                      child: Text(
                        'Start the morning with your health',
                        style: utils.Styles.texts['s1'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Align(
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
