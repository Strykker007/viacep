import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'assets/error.json',
          height: 250,
          repeat: false,
        ),
        Text(
          'Nenhum dado a ser exibido, para começar informe um cep ou endereço nos campos acima!',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
