import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/autentication_bloc/bloc.dart';

import 'ThemeColors.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var splashColour = kprimaryLightColor.withOpacity(0.5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 4.0,
      child: Container(
        color: ksecondaryDarkColor,
//        decoration: BoxDecoration(),
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  //header
                  UserAccountsDrawerHeader(
                    accountName: BlocBuilder(
                        bloc: BlocProvider.of<AuthenticationBloc>(context),
                        builder:
                            (BuildContext context, AuthenticationState state) {
                          if (state is Authenticated) {
                            return Text("${state.displayName}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold));
                          }
                        }),
//                    accountEmail: Text(
//                      '${_userRepository.getUser().toString()}',
//                      style:
//                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                    ),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.perm_identity,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(),
                  ),
                  InkWell(
                    highlightColor: splashColour,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/');
                    },
                    child: ListTile(
                      title: Text('Home',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: splashColour,
                    onTap: () {},
                    child: ListTile(
                      title: Text('My Account',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      leading: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      BlocProvider.of<AuthenticationBloc>(context)
                          .dispatch(LoggedOut());
                    },
                    child: ListTile(
                      title: Text('Logout',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                // This align moves the children to the bottom
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    // This container holds all the children that will be aligned
                    // on the bottom and should not scroll with the above ListView
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Divider(
                            height: 5.0,
                            color: Colors.white,
                          ),
                          InkWell(
                            highlightColor: splashColour,
                            onTap: () {},
                            child: ListTile(
                              title: Text('Settings',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white)),
                              leading: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            highlightColor: splashColour,
                            onTap: () {},
                            child: ListTile(
                              title: Text('Help and Feedback',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white)),
                              leading: Icon(
                                Icons.help,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
