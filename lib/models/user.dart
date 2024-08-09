class User {
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
    );
  }

  User copyWith({
    String? username,
    String? password,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
