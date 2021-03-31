import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'widgets/tool_box.dart' as utils;
import 'dashboard.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;

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
      duration: Duration(milliseconds: 800),
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
    ).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeInOutQuad))
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Dashboard(),
                duration: Duration(
                  milliseconds: 650,
                ),
              ),
            );

            Future.delayed(Duration(milliseconds: 1000)).then(
              (value) => scaleController.reverse(),
            );
            break;

          default:
            break;
        }
      });

    // Starts the animation
    rippleController.forward();
  }

  Widget makePage({image = 'assets/images/one.jpg', title = 'Exercise 1'}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: utils.Styles.containers['decoration1'],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 60.0),
              Text(title, style: utils.Styles.texts['h1']),
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
              SizedBox(height: 100.0),
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
                              decoration: utils.Styles.containers['circle']!
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [
          makePage(),
          makePage(image: 'assets/images/two.jpg', title: 'Exercise 2'),
          makePage(image: 'assets/images/three.jpg', title: 'Exercise 3'),
        ],
      ),
    );
  }
}
