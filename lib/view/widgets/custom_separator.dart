import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({
    super.key,
    this.height = 5,
    this.width = 5,
    this.space = 2,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
    this.constraints,
  });

  final double height;
  final double width;
  final double space;
  final Color color;
  final EdgeInsets padding;
  final BoxConstraints? constraints;

  Widget _buildSeparator(BoxConstraints constraints) {
    final boxWidth = constraints.constrainWidth();
    final separatorCount = (boxWidth / (2 * (width * space))).floor();
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: List.generate(
        separatorCount,
        (_) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: constraints != null
            ? Builder(builder: (context) => _buildSeparator(constraints!))
            : LayoutBuilder(
                builder: (context, constraints) => _buildSeparator(constraints),
              ),
      );
}
