import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class Indicator extends StatelessWidget {
  Indicator({
    required this.controller,
    this.itemCount: 0,
  });

  final PageController controller;

  final int itemCount;

  final double size = 8.0;

  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % pageCount : 0);

    return new AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width:  isCurrentPageSelected ? 8 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: isCurrentPageSelected ? primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size , spacing);
      }),
    );
  }
}