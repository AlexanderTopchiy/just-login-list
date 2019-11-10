import 'package:flutter/material.dart';
import 'package:just_login_list/data/models.dart';
import 'package:just_login_list/logic/users_logic.dart';

/// This class represent UI of Users list screen
class UsersScreen extends StatefulWidget {
  final UsersLogic usersLogic = UsersLogic();

  @override
  UsersScreenState createState() => UsersScreenState();
}

class UsersScreenState extends State<UsersScreen> {
  Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = widget.usersLogic.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<User>>(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 100,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'Пользователи',
                        style: TextStyle(color: Colors.black)
                      ),
                      centerTitle: true,
                    ),
                    backgroundColor: Colors.white,
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var user = snapshot.data[index];
                        return ListTile(
                          leading: Image.asset('assets/item_avatar.png'),
                          title: Text(
                            user.userName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(user.email),
                              Text(
                                user.company.name,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        );
                      },
                      childCount: snapshot.data.length,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Не удалось загрузить информацию');
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}