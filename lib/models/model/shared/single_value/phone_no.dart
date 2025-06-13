import 'package:darzi_nearby/models/models.dart';

class PhoneNo extends SingleValue {
  final String value;
  PhoneNo(dynamic value) : value = _getValue(value);
  static final emppty = PhoneNo('');

  static String phoneNoRegex =
      r'^\+?\d{1,3}[-.\s]?\(?\d{1,3}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$';
  static RegExp phoneNoSyntax = RegExp(phoneNoRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneNo &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is PhoneNo) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter phone no"
        : !phoneNoSyntax.hasMatch(value)
            ? "Invalid Phone Number Format"
            : null;
  }

  @override
  toString() {
    return value;
  }

  bool get isValidWhatsAppNumber {
    // Remove any non-digit characters
    String cleanedNumber = value.replaceAll(RegExp(r'\D'), '');

    // Check if the number starts with '03' (for Pakistan numbers)
    if (cleanedNumber.startsWith('03')) {
      return true;
    } else {
      return false;
    }
  }

  String get toWhatsAppFormat {
    // Remove any non-digit characters
    String cleanedNumber = value.replaceAll(RegExp(r'\D'), '');
    // If the number starts with '0', replace it with the country code for Pakistan ('92')
    if (cleanedNumber.startsWith('0')) {
      cleanedNumber = '92${cleanedNumber.substring(1)}';
    }
    // If the number does not start with a '+', add it
    if (!cleanedNumber.startsWith('+')) {
      cleanedNumber = '+$cleanedNumber';
    }
    return cleanedNumber;
  }

  // Function to return WhatsApp number format with spaces
  String get toWhatsAppFormatWithSpaces {
    // Get the WhatsApp number format
    String formattedNumber = toWhatsAppFormat;
    // Add spaces between country code, area code, and the rest of the number
    if (formattedNumber.startsWith('+92')) {
      // For Pakistan numbers
      if (formattedNumber.length == 12) {
        // If the length is 12, add spaces after country code and area code
        formattedNumber = '+92 ' +
            formattedNumber.substring(3, 7) +
            ' ' +
            formattedNumber.substring(7);
      } else if (formattedNumber.length > 12) {
        // If the length is greater than 12, add spaces after country code and area code
        formattedNumber = '+92 ' +
            formattedNumber.substring(3, 6) +
            ' ' +
            formattedNumber.substring(6);
      }
    }

    return formattedNumber;
  }
}
