import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ThemeColors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  var splashColor = kprimaryDarkColor.withOpacity(0.3);
  final String title;
  final bool isSearchIconEnabled;

  CustomAppBar({this.title, this.isSearchIconEnabled});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isSearchIconEnabled,
      elevation: 0.0,
      backgroundColor: Theme.of(context).canvasColor,
      primary: true,
      title: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: Text(title,
              style: TextStyle(
                letterSpacing: 12,
//                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              )),
        ),
      ),
      actions: isSearchIconEnabled
          ? <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15.0),
                child: IconButton(
                    splashColor: splashColor,
                    icon: Icon(
                      FontAwesomeIcons.search,
//                      color: Theme.of(context).primaryColor,
                      size: 25.0,
                    ),
                    onPressed: () {}),
              ),
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
