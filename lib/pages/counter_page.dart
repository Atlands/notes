import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _value = 2020;

  _change(int v) {
    setState(() {
      _value += v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动计数器'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_value.toString().length, (index) {
                  return AnimatedCounter(int.parse(_value.toString()[index]),
                      duration: const Duration(seconds: 1));
                }),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () => _change(1), child: const Text('+1')),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () => _change(-1), child: const Text('-1')),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () => _change(10), child: const Text('+10')),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () => _change(-10), child: const Text('-10')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter(
    this.value, {
    Key? key,
    required this.duration,
    this.style = const TextStyle(fontSize: 100, color: Colors.black),
  }) : super(key: key);
  final int value;
  final Duration duration;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      tween: Tween(end: value.toDouble()),
      builder: (BuildContext context, double value, Widget? child) {
        var whole = value ~/ 1;
        var decimal = value - whole;
        var size = style.fontSize!;
        return DefaultTextStyle(
          style: style,
          child: Stack(
            children: [
              const Opacity(opacity: 0, child: Text('1')),
              Positioned(
                  top: -size * decimal,
                  child: Opacity(opacity: 1 - decimal, child: Text('$whole'))),
              Positioned(
                  top: size * (1 - decimal),
                  child:
                      Opacity(opacity: decimal, child: Text('${whole + 1}'))),
            ],
          ),
        );
      },
    );
  }
}
