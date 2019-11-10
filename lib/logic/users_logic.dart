import 'dart:convert';

import 'package:just_login_list/data/models.dart';
import 'package:just_login_list/data/users_repository.dart';

/// This class represent logic for Users list screen
class UsersLogic {

  List<User> users = List<User>();

  Future<List<User>> getUsers() async {
    final response = await UserRepository.getUsers();

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return users = list.map((model) => User.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}