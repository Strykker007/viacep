import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/loading.json',
    );
  }
}
