class User {
  final int userId;
  final String username;
  final String password;
  final String email;
  final bool isEmailConfirmed;

  const User({
    required this.userId,
    required this.username,
    required this.password,
    required this.email,
    required this.isEmailConfirmed
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      isEmailConfirmed: json['isEmailConfirmed'],
    );
  }
}
