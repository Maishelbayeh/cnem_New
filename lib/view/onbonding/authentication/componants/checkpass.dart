class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال كلمة مرور";
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return "يجب أن تحتوي كلمات المرور على حرف كبير واحد على الأقل.";
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return "يجب أن تحتوي كلمات المرور على رقم واحد على الأقل.";
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return "يجب أن تحتوي كلمات المرور على رمز واحد على الأقل.";
    }
    if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
      return "يجب ألا تحتوي كلمة المرور على أحرف عربية.";
    }
    return null;
  }
}
