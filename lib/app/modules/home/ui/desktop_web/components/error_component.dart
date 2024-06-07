// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorComponent extends StatelessWidget {
  final String? message;
  const ErrorComponent({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'assets/error.json',
          height: 250,
        ),
        Text(
          'Ops, ocorreu um erro com sua requisição! Tente novamente!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            message ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
