/// These classes use for serialization JSON and display data in the list
class User {
  final int id;
  final String userName;
  final String email;
  final Company company;

  User({this.id, this.userName, this.email, this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['name'],
      email: json['email'],
      company: Company.fromJson(json['company'])
    );
  }
}

class Company {
  final String name;

  Company({this.name});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(name: json['name']);
  }
}