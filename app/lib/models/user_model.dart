class User {
  final int userId;
  final String userToken;

  const User({required this.userId, required this.userToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(userId: json['id'], userToken: json['token']);
  }
}
