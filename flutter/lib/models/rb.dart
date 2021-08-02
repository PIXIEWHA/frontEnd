class Rb {
  // ignore: non_constant_identifier_names
  String rb_id;
  // ignore: non_constant_identifier_names
  String rb_password;

  Rb({required this.rb_id, required this.rb_password});

  factory Rb.fromJson(Map<String, dynamic> json) {
    return Rb(rb_id: json['rb_id'], rb_password: json['rb_password']);
  }
  dynamic toJson() => {'rb_id': rb_id, 'rb_password': rb_password};
}
