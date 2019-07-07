import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => InitialProductState();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is isLoading) {
      yield LoadingProductState();
    } else if (event is isLoaded) {
      yield LoadedProductState();
    }
  }
}
