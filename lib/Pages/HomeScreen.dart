import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Components/CustomAppBar.dart';
import 'package:shopapp/Components/Drawer.dart';
import 'package:shopapp/Components/ProductList.dart';
import 'package:shopapp/product_bloc/bloc.dart';
import 'package:shopapp/product_bloc/product_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductBloc _productBloc;

  @override
  void dispose() {
    _productBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _productBloc = ProductBloc();
    _productBloc.dispatch(isLoading());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => _productBloc,
      child: Scaffold(
//      floatingActionButton: Padding(
//        padding: const EdgeInsets.only(bottom: 15.0),
//        child: Container(
//          width: 65.0,
//          height: 65.0,
//          decoration: BoxDecoration(
//              color: Theme.of(context).primaryColor,
//              shape: BoxShape.circle,
//              boxShadow: [
//                BoxShadow(
//                    color: Theme.of(context).primaryColor.withOpacity(.5),
//                    offset: Offset(0.0, 10.0),
//                    blurRadius: 10.0)
//              ]),
//          child: RawMaterialButton(
//            shape: CircleBorder(),
//            child: Icon(
//              Icons.add,
//              size: 35.0,
//              color: Colors.white,
//            ),
//            onPressed: () {},
//          ),
//        ),
//      ),
        appBar:
            CustomAppBar(title: "Marhaba Trading", isSearchIconEnabled: true),
        drawer: CustomDrawer(),
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 8.0),
            children: <Widget>[
              //Padding
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                  child: Text('Type\'s of Fasteners ',
                      style: TextStyle(
//                      color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 27.0,
                      ))),
              //Horizontal List View
//            HorizontalList(),
              SizedBox(height: 25),
              //GridView
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
                      if (state is LoadingProductState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is LoadedProductState) {
                        return ProductList();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
