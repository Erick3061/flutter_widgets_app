import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'ProgressScreen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(name)),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Circular indicator'),
          const SizedBox(height: 10),
          CircularProgressIndicator(
            color: colors.primary,
            strokeWidth: 2,
            backgroundColor: Colors.black26,
          ),
          const SizedBox(height: 20),
          const Text('Circular y Linear indicator controlado'),
          const SizedBox(height: 10),
          const _ControllerProressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProressIndicator extends StatelessWidget {
  const _ControllerProressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300),
          (computationCount) {
        return (computationCount * 2) / 100;
      }).takeWhile((element) => element < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black12,
                value: progressValue,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
