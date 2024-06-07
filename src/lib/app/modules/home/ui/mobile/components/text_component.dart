import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool textInPrimaryColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textInPrimaryColor = false,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Não informado',
      style: style ??
          Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: fontWeight ?? FontWeight.normal,
                color: textInPrimaryColor
                    ? Theme.of(context).colorScheme.primary
                    : null,
                fontSize: fontSize,
              ),
      textAlign: TextAlign.start,
    );
  }
}
