import 'package:flutter/material.dart';
import 'package:shopapp/Components/Drawer.dart';
import 'package:shopapp/Components/CustomAppBar.dart';
import 'package:shopapp/Components/ThemeColors.dart';
import 'package:shopapp/Components/HorizontalList.dart';
import 'login.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopapp/Components/Products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto',
          brightness: Brightness.light,
          primaryColor: kprimaryColor,
          primaryColorDark: kprimaryDarkColor,
          primaryColorLight: kprimaryLightColor,
          accentColor: ksecondaryDarkColor,
          bottomAppBarColor: ksecondaryDarkColor,
          buttonColor: ksecondaryColor,
          sliderTheme: SliderThemeData.fromPrimaryColors(
              primaryColor: kprimaryColor,
              primaryColorDark: kprimaryDarkColor,
              primaryColorLight: kprimaryLightColor,
              valueIndicatorTextStyle: TextStyle())),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: CustomAppBar(title: "Marhaba Trading"),
      drawer: new CustomDrawer(),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 8.0),
          children: <Widget>[
            //Padding
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Text('Type\'s of Fasteners ',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 27.0,
                    ))),
            //Horizontal List View
//            HorizontalList(),
            SizedBox(height: 10),
            //GridView
            Products(),
          ],
        ),
      ),
    );
  }
}

Widget image_carosel() {
  return Container(
    height: 225.0,
    child: Carousel(
      images: [
        AssetImage('Images/Carousel_1.jpg'),
        AssetImage('Images/Carosel_2.jpg'),
        AssetImage('Images/Carousel_3.jpg'),
      ],
      autoplayDuration: Duration(milliseconds: 5000),
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 6.0,
      dotSpacing: 25.0,
      dotColor: kprimaryDarkColor,
      indicatorBgPadding: 10.0,
      dotBgColor: ktransparent,
      borderRadius: false,
//        moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      overlayShadow: true,
      overlayShadowColors: Colors.white,
      overlayShadowSize: 0.7,
    ),
  );
}
