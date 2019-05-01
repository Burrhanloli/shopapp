import 'package:flutter/material.dart';
import 'ThemeColors.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Category(
              image_caption: 'Allen Cap',
            ),
            Category(
              image_caption: 'Hex Bolt',
            ),
            Category(
              image_caption: 'Hex Nut',
            ),
            Category(
              image_caption: 'Dowel Pin',
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_caption;

  const Category({Key key, this.image_caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 125.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
//          boxShadow: <BoxShadow>[
//            BoxShadow(
//                color: Colors.black26,
//                offset: new Offset(0.0, 2.0),
//                blurRadius: 15.0)
//          ],
          gradient: LinearGradient(
              colors: [kprimaryDarkColor, kprimaryLightColor, kprimaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.mirror),
//          border: Border.all(color: Colors.white70, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            splashColor: kprimaryLightColor,
//            highlightColor: kprimaryLightColor,
            onTap: () {},
            child: Align(
              alignment: Alignment.center,
              child: Text(
                image_caption,
                style: TextStyle(
//                      color: kprimaryTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
