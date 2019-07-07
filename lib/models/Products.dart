import 'package:lombok/lombok.dart';

@data
class Product {
  final String productName;

  Product(
      {this.productSize,
      this.productName,
      this.productImage,
      this.productImages,
      this.productMaterial,
      this.productDescription});

  final String productImage;
  final List<String> productImages;
  final List<String> productMaterial;
  final String productDescription;
  final List<String> productSize;
}
