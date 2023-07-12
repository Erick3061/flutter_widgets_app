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

class _TutorialFH extends StatelessWidget {
  const _TutorialFH();

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.green,
    );
  }
}

class _TutorialFlutter extends StatelessWidget {
  const _TutorialFlutter();

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.blue,
    );
  }
}
