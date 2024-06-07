import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {
  static MaskTextInputFormatter generateMask(String mask,
      {String? initialText}) {
    return MaskTextInputFormatter(
      mask: mask,
      filter: {'#': RegExp(r'[0-9]')},
      initialText: initialText,
    );
  }
}
