mixin ValidationInputMixin {
  bool isFieldEmpty(String? fieldValue) => fieldValue?.isEmpty ?? true;

  bool isFieldSubmited(String fieldValue) {
    if (isFieldEmpty(fieldValue)) return false;
    final String digitsOnly = fieldValue.replaceAll(RegExp(r'[^\d]'), '');

    return digitsOnly.length == 10;
  }

  String replaceNumber(String input) {
    RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{4})$');

    String formattedPhoneNumber = input.replaceAllMapped(
      regExp,
      (match) => '(${match[1]})-${match[2]}-${match[3]}',
    );
    return formattedPhoneNumber;
  }

  String formatEditUpdate(String input) {
    final StringBuffer newText = StringBuffer();

    // Remove all characters except digits
    final String digitsOnly = input.replaceAll(RegExp(r'[^\d]'), '');

    // Add opening bracket
    if (digitsOnly.isNotEmpty) {
      newText.write('(');
    }

    // Add first three digits
    if (digitsOnly.length >= 3) {
      newText.write('${digitsOnly.substring(0, 3)})');
    } else {
      newText.write(digitsOnly.substring(0));
      return newText.toString();
    }

    // Add hyphen after the opening bracket
    if (digitsOnly.length >= 4) {
      newText.write(' ');
    }

    // Add next three digits
    if (digitsOnly.length >= 6) {
      newText.write('${digitsOnly.substring(3, 6)}-');
    } else {
      newText.write(digitsOnly.substring(3));
      return newText.toString();
    }

    // Add last four digits
    if (digitsOnly.length >= 10) {
      newText.write(digitsOnly.substring(6, 10));
    } else {
      newText.write(digitsOnly.substring(6));
    }

    return newText.toString();
  }
}
