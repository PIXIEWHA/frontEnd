class User {
  // ignore: non_constant_identifier_names
  String username;
  // ignore: non_constant_identifier_names
  String email;
  // ignore: non_constant_identifier_names
  String password;

  User({required this.username, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
  dynamic toJson() =>
      {'username': username, 'email': email, 'password': password};
}
