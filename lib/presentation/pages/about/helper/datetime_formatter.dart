import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _formatDate(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatDate(String value) {
    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length < 3) {
      return value;
    } else if (value.length < 5) {
      return '${value.substring(0, 2)} ${value.substring(2)}';
    } else if (value.length <= 8) {
      return '${value.substring(0, 2)} ${value.substring(2, 4)} ${value.substring(4)}';
    } else {
      return '${value.substring(0, 2)} ${value.substring(2, 4)} ${value.substring(4, 8)}';
    }
  }
}
