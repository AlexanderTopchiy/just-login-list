import 'package:http/http.dart' as http;

final baseUrl = 'https://jsonplaceholder.typicode.com';
final usersRoute = '/users';

class UserRepository {

  static Future getUsers () async {
    return await http.get(baseUrl + usersRoute);
  }
}