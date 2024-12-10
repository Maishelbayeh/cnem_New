class User {
  late String email;
  late String phone;
  final String password;
  late String? confirmPassword;
  late bool confirmEmail;
  late String? authToken;
  late String? userId;

  User({
    required this.email,
    required this.phone,
    required this.password,
    this.confirmPassword,
    this.authToken,
    this.userId,
    required this.confirmEmail,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  void clear() {
    email = '';
    phone = '';
    confirmPassword = null;
    confirmEmail = false;
    authToken = null;
    userId = null;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      phone: json['phoneNumber'] ?? '',
      password: '', // Password should not be included in the JSON response
      confirmPassword: json['confirmPassword'],
      confirmEmail: json['confirmEmail'] ?? false,
      authToken: json['token'],
      userId: json['userId'],
    );
  }
}
