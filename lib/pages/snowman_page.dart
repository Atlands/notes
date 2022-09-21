import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnowmanPage extends StatefulWidget {
  const SnowmanPage({Key? key}) : super(key: key);

  @override
  State<SnowmanPage> createState() => _SnowmanPageState();
}

class _SnowmanPageState extends State<SnowmanPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  final List<Snowflake> snowflakes = List.generate(100, (index) => Snowflake());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isAnimating) {
            controller.reset();
          } else {
            controller.repeat();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.8, 0.95],
                colors: [Colors.blue, Colors.lightBlueAccent, Colors.white])),
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            for (var element in snowflakes) {
              element.fall();
            }
            return CustomPaint(painter: MyPainter(snowflakes));
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Snowflake> snowflakes;

  MyPainter(this.snowflakes);

  final Paint whitePaint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    for (var element in snowflakes) {
      canvas.drawCircle(
          Offset(element.x, element.y), element.radius, whitePaint);
    }

    canvas.drawCircle(size.bottomCenter(const Offset(0, -250)), 80, whitePaint);
    canvas.drawOval(
        Rect.fromCenter(
            center: size.bottomCenter(const Offset(0, 0)),
            width: 300,
            height: Get.height / 2),
        whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Snowflake {
  double x = Random().nextDouble() * Get.width,
      y = Random().nextDouble() * Get.height,
      radius = Random().nextDouble() * 2 + 2,
      velocity = Random().nextDouble() * 2 + 4;

  fall() {
    y += velocity;
    if (y > Get.height) _init();
  }

  _init() {
    x = Random().nextDouble() * Get.width;
    y = -10;
    radius = Random().nextDouble() * 2 + 2;
    velocity = Random().nextDouble() * 2 + 4;
  }
}
