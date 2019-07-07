import 'package:flutter/material.dart';
import 'package:shopapp/Components/PageIndicator.dart';
import 'package:shopapp/Pages/ProductDetails.dart';

import '../data.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 500.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleProduct(
                productDescription: productList[index]["description"],
                productImages: productList[index]["pictures"],
                productName: productList[index]['name'],
                productImage: productList[index]['picture'],
                productMaterial: productList[index]['material'],
              );
            }),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productImage;
  final productDescription;
  final List<String> productImages;
  final List<String> productMaterial;

  SingleProduct(
      {this.productName,
      this.productImage,
      this.productMaterial,
      this.productImages,
      this.productDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
      child: SizedBox(
        width: 200.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 45.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0)
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        productDescription: productDescription,
                        productName: productName,
                        productImages: productImages,
                        productMaterial: productMaterial,
                        productImage: productImage,
                      ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    productImage,
                    width: 170.0,
                    height: 200.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          productName,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 60.0),
                        Text(
                          "Materials",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54),
                        ),
                        ChipForMaterials(true, productMaterial)
//                        Chip(
//                            label: Text(
//                          productMaterial[0],
//                          style: TextStyle(
//                            fontSize: 15.0,
//                            fontWeight: FontWeight.w900,
////                            color: Theme.of(context).primaryColor
//                          ),
//                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
