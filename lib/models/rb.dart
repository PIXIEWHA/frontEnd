class Rb {
  // ignore: non_constant_identifier_names
  String email;
  // ignore: non_constant_identifier_names
  String rb_id;
  // ignore: non_constant_identifier_names
  String rb_password;

  Rb({required this.email, required this.rb_id, required this.rb_password});

  factory Rb.fromJson(Map<String, dynamic> json) {
    return Rb(
        email: json['email'],
        rb_id: json['rb_id'],
        rb_password: json['rb_password']);
  }
  dynamic toJson() =>
      {'email': email, 'rb_id': rb_id, 'rb_password': rb_password};
}
