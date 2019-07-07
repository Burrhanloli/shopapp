import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/Components/CustomAppBar.dart';
import 'package:shopapp/Components/Drawer.dart';
import 'package:shopapp/Components/ProductList.dart';
import 'package:shopapp/models/Products.dart';
import 'package:shopapp/product_bloc/bloc.dart';

import '../data.dart';

class NewHomeScreen extends StatefulWidget {
  NewHomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewHomeScreen> {
  ProductBloc _productBloc;

  @override
  void dispose() {
    _productBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _productBloc = ProductBloc();
    _productBloc.dispatch(isLoading());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "MTC", isSearchIconEnabled: true),
        drawer: CustomDrawer(),
        body: Container(
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Text('Type\'s of Fasteners ',
                          style: TextStyle(
//                      color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 27.0,
                          )))),
              BlocListener(
                bloc: _productBloc,
                listener: (BuildContext context, ProductState state) {
                  if (state is LoadingProductState) {
                    _productBloc.dispatch(isLoaded());
                  }
                },
                child: BlocBuilder(
                    bloc: _productBloc,
                    builder: (BuildContext context, ProductState state) {
                      if (state is InitialProductState) {
                        return Container();
                      }
                      if (state is LoadingProductState) {
                        return Flexible(
                          child: Center(child: CircularProgressIndicator()),
                          flex: 6,
                        );
                      }
                      if (state is LoadedProductState) {
                        return Flexible(flex: 5, child: ProductList());
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
