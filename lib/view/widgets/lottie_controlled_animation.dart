import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieControlledAnimation extends StatefulWidget {
  const LottieControlledAnimation({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.lottiePath,
    this.duration = const Duration(milliseconds: 3000),
    this.animationHeightFactor = 0.24,
  });

  final EdgeInsets padding;
  final String lottiePath;
  final Duration duration;
  final double animationHeightFactor;

  @override
  State<LottieControlledAnimation> createState() => _LottieControlledAnimationState();
}

class _LottieControlledAnimationState extends State<LottieControlledAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(covariant LottieControlledAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => controller.forward(from: 0),
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          height: screenSize.height * widget.animationHeightFactor,
          child: LottieBuilder.asset(
            widget.lottiePath,
            controller: controller,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
