import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Components/PageIndicator.dart';
import 'package:shopapp/Pages/ProductDetails.dart';
import 'package:shopapp/models/Products.dart';
import 'package:shopapp/product_bloc/bloc.dart';
import 'ThemeColors.dart';

import '../data.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(products[index]);
        });
  }
}

class SingleProduct extends StatelessWidget {
  final Product product;

  SingleProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.0, bottom: 50.0),
      child: Container(
        width: 300.0,
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
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                        offset: Offset(0.0, -5.0),
                        blurRadius: 15.0)
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        product: product,
                      ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Image.asset(
                      product.productImage,
                      width: 170.0,
                      height: 200.0,
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(flex: 1,child: Container(),),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.productName,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Flexible(flex: 1,child: Container(),),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Materials",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              width: 290,
                              child: ChipForMaterials(true, productMaterial)),
                          Flexible(flex: 1,child: Container(),),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Sizes",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              width: 290,
                              child: ChipForMaterials(true, productSizes))
                        ],
                      ),
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
