String extractPhoneNumber(String phoneNumber) {
  // Use regular expressions to remove the country code if present
  // Escaped '+' character to match a literal '+'
  String pattern =
      r"^\+?\d+"; // Matches "+" followed by any digits (country code)
  return phoneNumber.replaceFirst(RegExp(pattern), "");
}
