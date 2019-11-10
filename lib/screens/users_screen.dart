import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_login_list/data/models.dart';
import 'package:just_login_list/logic/users_logic.dart';
import 'package:just_login_list/resources/res_colors.dart';
import 'package:just_login_list/resources/res_images.dart';
import 'package:just_login_list/resources/res_strings.dart';
import 'package:just_login_list/resources/res_styles.dart';

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
                        ResStrings.users,
                        style: ResStyles.blackText
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
                          leading: Image.asset(ResImages.user_avatar),
                          title: Text(
                            user.userName,
                            style: ResStyles.ltTitle,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(user.email),
                              Text(
                                user.company.name,
                                style: ResStyles.blackText,
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(ResImages.warning),
                  SizedBox(height: 36),
                  Text(ResStrings.cantLoadInfo),
                  SizedBox(height: 36),
                  MaterialButton(
                    onPressed: () => _refreshButtonCallback(),
                    color: ResColors.accessed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minWidth: 230,
                    height: 38,
                    child: Text(
                      ResStrings.refresh,
                      style: ResStyles.btText,
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(ResColors.accessed),
            );
          }
        ),
      ),
    );
  }

  void _refreshButtonCallback() {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => UsersScreen()));
  }
}