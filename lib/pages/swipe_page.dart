import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class SwipePage extends StatelessWidget {
  SwipePage({Key? key}) : super(key: key);

  final List<String> _tabs = ['standard', 'custom'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Center(
                child: TabBar(tabs: _tabs.map((e) => Tab(text: e)).toList()))),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 300,
                child: SwipableStack(
                  builder: (BuildContext context, properties) {
                    return Container(
                      constraints: const BoxConstraints.expand(),
                      color: Colors.primaries[
                          properties.index % Colors.primaries.length],
                    );
                  },
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 300,
                child: SwipableStack(
                    viewFraction: 1,
                    // dragStartBehavior: DragStartBehavior.down,
                    allowVerticalSwipe: false,
                    detectableSwipeDirections: const {
                      SwipeDirection.right,
                      SwipeDirection.left,
                    },
                    horizontalSwipeThreshold: 0.8,
                    verticalSwipeThreshold: 0.01,
                    // controller: _controller,
                    builder: (_, properties) {
                      var offset = Offset.zero;

                      if (properties.stackIndex == 0) {
                        offset = const Offset(-8, 8);
                      } else if (properties.stackIndex == 2) {
                        offset = const Offset(8, -8);
                      }

                      return Transform.translate(
                        offset: offset,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: widget.builder(properties.index % widget.itemCount),
                          child: Container(
                            constraints: const BoxConstraints.expand(),
                            color: Colors.primaries[
                                properties.index % Colors.primaries.length],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
