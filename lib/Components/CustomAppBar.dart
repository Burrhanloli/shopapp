import 'package:flutter/material.dart';
import 'ThemeColors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  var splashColor = kprimaryDarkColor.withOpacity(0.3);
  final String title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
//            kprimaryLightColor,
            kprimaryColor,
            kprimaryDarkColor,
            Colors.black87
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      primary: true,
      brightness: Brightness.dark,
      title: Align(
        alignment: Alignment.center,
        child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
            )),
      ),
      actions: <Widget>[
        IconButton(
            splashColor: splashColor,
            icon: Icon(
              Icons.search,
//                  color: kprimaryDarkColor,
              size: 30.0,
            ),
            onPressed: () {}),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}
