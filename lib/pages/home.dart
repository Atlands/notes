import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/pages/counter_page.dart';
import 'package:notes/pages/snowman_page.dart';
import 'package:notes/pages/swipe_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          _Item(
            '雪人',
            onPressed: () => Get.to(() => const SnowmanPage()),
          ),
          _Item(
            '滚动计数器',
            onPressed: () {
              Get.to(() => const CounterPage());
            },
          ),
          _Item(
            '堆叠卡片',
            onPressed: () => Get.to(() => SwipePage()),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.title, {Key? key, this.onPressed}) : super(key: key);
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.navigate_next),
      onTap: onPressed,
    );
  }
}
