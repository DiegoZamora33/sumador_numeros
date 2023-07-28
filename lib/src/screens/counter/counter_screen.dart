import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counterClicks = 0;
  String plural = 's';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '$counterClicks',
            style: const TextStyle(fontSize: 110, fontWeight: FontWeight.w500),
          ),
          Text(
            'Click$plural',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
          )
        ])),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyButton(
              icon: const Icon(Icons.replay_outlined),
              onPressed: () {
                restart();
              },
            ),
            MyButton(
              icon: const Icon(Icons.plus_one),
              onPressed: () {
                addClick();
              },
            ),
            MyButton(
              icon: const Icon(Icons.exposure_minus_1_outlined),
              onPressed: () {
                lessClick();
              },
            ),
          ],
        ));
  }

  void addClick() {
    setState(() {
      counterClicks++;
      if (counterClicks == 1 || counterClicks == -1) {
        plural = '';
      } else {
        plural = 's';
      }
    });
  }

  void lessClick() {
    setState(() {
      counterClicks--;
      if (counterClicks == 1 || counterClicks == -1) {
        plural = '';
      } else {
        plural = 's';
      }
    });
  }

  void restart() {
    setState(() {
      counterClicks = 0;
      plural = 's';
    });
  }
}

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: FloatingActionButton(
        elevation: 4,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
