import 'package:flutter/material.dart';
import 'package:shopapp/Pages/ProductDetails.dart';
import 'ThemeColors.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Allen Cap",
      "picture": "images/products/blazer1.jpeg",
      "material": "SS",
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "material": "SS",
    },
    {
      "name": "Red",
      "picture": "images/products/dress2.jpeg",
      "material": "SS",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: 500.0,
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: product_list.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return SingleProduct(
                product_name: product_list[index]['name'],
                product_img: product_list[index]['picture'],
                product_material: product_list[index]['material'],
              );
            }),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final product_name;
  final product_img;
  final product_material;

  SingleProduct({this.product_name, this.product_img, this.product_material});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, top: 15.0, right: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [kprimaryDarkColor, kprimaryLightColor, kprimaryColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 13.0,
                  offset: Offset(0, 2.0))
            ]),
        child: Hero(
          tag: product_name,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              splashColor: kprimaryLightColor.withOpacity(0.5),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails())),
              child: GridTile(
                  footer: ListTile(
                    subtitle: Text(
                      "$product_material",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: kprimaryTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Material Type",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: ksecondaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text(
                        product_name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w900),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
