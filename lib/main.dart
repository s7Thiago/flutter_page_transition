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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController? _pageController;

  // Ripple Animation
  late AnimationController rippleController;
  late AnimationController scaleController;

  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Setting up the ripple animations
    rippleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Used in container size variation
    rippleAnimation = Tween<double>(
      begin: 80.0,
      end: 90.0,
    ).animate(
      CurvedAnimation(
        parent: rippleController,
        curve: Curves.easeInOutQuad,
      ),
    )..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            rippleController.reverse();
            break;
          case AnimationStatus.dismissed:
            rippleController.forward();
            break;

          default:
            break;
        }
      });

// Used when user taps on inkwell inside the container
    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(scaleController);

    // Starts the animation
    rippleController.forward();
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
                    SizedBox(height: 120.0),
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
                      child: AnimatedBuilder(
                        animation: rippleAnimation,
                        builder: (context, child) => Container(
                          width: rippleAnimation.value,
                          height: rippleAnimation.value,
                          child: Container(
                            decoration: utils.Styles.containers['circle'],
                            child: InkWell(
                              onTap: () {
                                scaleController.forward();
                              },
                              child: AnimatedBuilder(
                                animation: scaleAnimation,
                                builder: (context, child) => Transform.scale(
                                  scale: scaleAnimation.value,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: utils
                                        .Styles.containers['circle']!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
