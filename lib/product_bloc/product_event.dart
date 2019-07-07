import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent extends Equatable {
  ProductEvent([List props = const []]) : super(props);
}

class isLoading extends ProductEvent {
  @override
  String toString() => "isLoading";
}

class isLoaded extends ProductEvent {
  @override
  String toString() => "Loaded!";
}
