import 'package:flutter/material.dart';

class HorizontalCardList extends StatelessWidget {
  final int itemCount;
  final double height;
  final double cardWidthRatio;
  final Widget Function(BuildContext, int) itemBuilder;

  const HorizontalCardList({
    super.key,
    required this.itemCount,
    required this.height,
    required this.cardWidthRatio,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SizedBox(
            width: screenWidth * cardWidthRatio,
            child: itemBuilder(context, index),
          );
        },
      ),
    );
  }
}
