import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/rb.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserProvider() {
    this.fetchuser();
  }

  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  void addUser(User user) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/apis/user/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(user));
    if (response.statusCode == 201) {
      user.username = json.decode(response.body)['username'];
      _users.add(user);
      notifyListeners();
    }
  }

  void deleteUser(User user) async {
    final response = await http
        .delete(Uri.parse('http://10.0.2.2:8000/apis/user/${user.username}/'));
    if (response.statusCode == 204) {
      _users.remove(user);
      notifyListeners();
    }
  }

  fetchuser() async {
    final Uri url = Uri.parse("http://10.0.2.2:8000/apis/user/?format=json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _users = data.map<User>((json) => User.fromJson(json)).toList();
      notifyListeners();
    }
  }
}

class RbProvider with ChangeNotifier {
  RbProvider() {
    this.fetchrb();
  }

  List<Rb> _rbs = [];

  List<Rb> get rbs {
    return [..._rbs];
  }

  void addRb(Rb rb) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/apis/rbpi/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(rb));
    if (response.statusCode == 201) {
      rb.email = json.decode(response.body)['email'];
      _rbs.add(rb);
      notifyListeners();
    }
  }

  void deleteRb(Rb rb) async {
    final response = await http
        .delete(Uri.parse('http://10.0.2.2:8000/apis/rbpi/${rb.email}/'));
    if (response.statusCode == 204) {
      _rbs.remove(rb);
      notifyListeners();
    }
  }

  fetchrb() async {
    final Uri url = Uri.parse("http://10.0.2.2:8000/apis/rbpi/?format=json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _rbs = data.map<Rb>((json) => Rb.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
