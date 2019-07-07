import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductState extends Equatable {
  ProductState([List props = const []]) : super(props);
}

class InitialProductState extends ProductState {
  @override
  String toString() => "Uninitialized";
}

class LoadingProductState extends ProductState {
  @override
  String toString() => "Loading";
}

class LoadedProductState extends ProductState {
  @override
  String toString() => "Loaded!";
}
