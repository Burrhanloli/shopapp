import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/Components/Drawer.dart';
import 'package:shopapp/Components/PageIndicator.dart';
import 'package:shopapp/models/Products.dart';

import '../data.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

//  final productName;
//  final productImage;
//  final productImages;
//  final productMaterial;
//  final productDescription;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool isShrinked = true;
  AnimationController _controller;
  Animation<double> _titleAnim;
  Animation<double> _materialAnim;

//  List<String> images = widget.productImages;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    _titleAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.3)));
    _materialAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.5)));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();

    super.initState();
  }

  void _nextImage() {
    setState(() {
      if (_currentIndex < productImages.length - 1) {
        _currentIndex++;
        _controller.reset();
        _controller.forward();
      } else {
        _currentIndex = _currentIndex;
      }
    });
  }

  void _previosImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _controller.reset();
        _controller.forward();
      } else {
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: CustomDrawer(),
        body: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 300.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                        widget.product.productImages[_currentIndex]),
                    color: Colors.black12,
                  ),
                  Positioned(
                      top: 40.0,
                      left: 20.0,
                      child: InkWell(
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )),
                  Positioned(
                    bottom: 30,
                    left: 35,
                    child: SizedBox(
                      width: 70.0,
                      child: PageIndicator(
                          _currentIndex, widget.product.productImages.length),
                    ),
                  ),
                  Positioned.fill(child: GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.velocity.pixelsPerSecond.dx > 0) {
                        _previosImage();
                      } else if (details.velocity.pixelsPerSecond.dx < 0) {
                        _nextImage();
                      }
                    },
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      widget.product.productName,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          height: 50,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return new Container(
                                    height: 600,
                                    child: ListView(
                                      children: <Widget>[
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              "The sizes that Marhaba offers for ${widget.product.productName} are:",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Divider(
                                              height: 10,
                                              color: Colors.white70),
                                        ),
                                        ChipForMaterials(
                                            false, widget.product.productSize)
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                "Sizes",
                                style: TextStyle(fontSize: 18),
                              )),
                              Icon(
                                Icons.view_list,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          height: 50,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return new Container(
                                    height: 300,
                                    child: ListView(
                                      children: <Widget>[
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              "The materials that Marhaba offers for ${widget.product.productName} are:",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Divider(
                                              height: 10,
                                              color: Colors.white70),
                                        ),
                                        ChipForMaterials(false,
                                            widget.product.productMaterial)
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                "Materials",
                                style: TextStyle(fontSize: 18),
                              )),
                              Icon(
                                Icons.view_list,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).accentColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          widget.product.productDescription,
                          style: TextStyle(fontSize: 16),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            onTap: () {},
            child: BottomAppBar(
              color: Theme.of(context).accentColor.withOpacity(0.75),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.envelope),
                    ),
                    Text("Send Enquiry")
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
