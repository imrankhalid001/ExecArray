import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';

  String get firstName => _firstName;
  String get lastName => _lastName;

  Future<void> loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    _firstName = prefs.getString('firstName') ?? 'john';
    _lastName = prefs.getString('lastName') ?? 'Snow';
    notifyListeners();
  }

  Future<void> saveUserDetails(String firstName, String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    _firstName = firstName;
    _lastName = lastName;
    notifyListeners();
  }
}
