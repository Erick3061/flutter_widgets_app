import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = 'AnimatedScreen';
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BottomNav();
  }
}

class _BottomNav extends StatefulWidget {
  const _BottomNav();

  @override
  State<_BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<_BottomNav> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example nav bottom'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
        },
        selectedIndex: currentPage,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.tv_rounded),
            label: 'Tuturial FH',
            tooltip: 'Erick',
          ),
          NavigationDestination(
              icon: Icon(Icons.tv_rounded), label: 'Tuturial Flutter'),
        ],
      ),
      body: <Widget>[
        const _TutorialFH(),
        const _TutorialFlutter()
      ][currentPage],
    );
  }
}

class _TutorialFH extends StatefulWidget {
  const _TutorialFH();

  @override
  State<_TutorialFH> createState() => _TutorialFHState();
}

class _TutorialFHState extends State<_TutorialFH> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;
    color = Color.fromRGBO(
      random.nextInt(255), //red
      random.nextInt(255), //green
      random.nextInt(255), //blue
      1, //opacity
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
          width: width <= 0 ? 0 : width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
    );
  }
}

class _TutorialFlutter extends StatefulWidget {
  const _TutorialFlutter();

  @override
  State<_TutorialFlutter> createState() => _TutorialFlutterState();
}

class _TutorialFlutterState extends State<_TutorialFlutter> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
