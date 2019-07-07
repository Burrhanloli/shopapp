import 'package:shopapp/models/Products.dart';

List<Product> products = []
  ..add(
    Product(
      productMaterial: productMaterial,
      productImage: "images/products/image_01.png",
      productImages: productImages,
      productName: "Allen Cap",
      productDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec felis metus. Vivamus eu urna tempor, pretium erat quis, volutpat eros. Cras consectetur dolor at venenatis feugiat. Fusce nunc risus, finibus eget augue ac, ornare gravida turpis. Morbi consequat, nisi sit amet viverra feugiat, lacus mauris ornare erat, at pharetra odio dolor id elit. Pellentesque eu aliquet ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed aliquam ante, vulputate fringilla leo. Integer dignissim neque at est interdum aliquet. Pellentesque malesuada, tortor in faucibus malesuada, nisl nibh ornare mauris, in sodales neque massa vitae libero. Duis tristique augue a elit sagittis eleifend. In vulputate porta lectus at pulvinar.",
      productSize: productSizes,
    ),
  )
  ..add(
    Product(
        productMaterial: productMaterial,
        productImage: "images/products/image_01.png",
        productImages: productImages,
        productName: "Button Cap",
        productDescription:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec felis metus. Vivamus eu urna tempor, pretium erat quis, volutpat eros. Cras consectetur dolor at venenatis feugiat. Fusce nunc risus, finibus eget augue ac, ornare gravida turpis. Morbi consequat, nisi sit amet viverra feugiat, lacus mauris ornare erat, at pharetra odio dolor id elit. Pellentesque eu aliquet ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed aliquam ante, vulputate fringilla leo. Integer dignissim neque at est interdum aliquet. Pellentesque malesuada, tortor in faucibus malesuada, nisl nibh ornare mauris, in sodales neque massa vitae libero. Duis tristique augue a elit sagittis eleifend. In vulputate porta lectus at pulvinar.",
        productSize: productSizes),
  )
  ..add(
    Product(
        productMaterial: productMaterial,
        productImage: "images/products/image_01.png",
        productImages: productImages,
        productName: "Hex Bolt",
        productDescription:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec felis metus. Vivamus eu urna tempor, pretium erat quis, volutpat eros. Cras consectetur dolor at venenatis feugiat. Fusce nunc risus, finibus eget augue ac, ornare gravida turpis. Morbi consequat, nisi sit amet viverra feugiat, lacus mauris ornare erat, at pharetra odio dolor id elit. Pellentesque eu aliquet ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed aliquam ante, vulputate fringilla leo. Integer dignissim neque at est interdum aliquet. Pellentesque malesuada, tortor in faucibus malesuada, nisl nibh ornare mauris, in sodales neque massa vitae libero. Duis tristique augue a elit sagittis eleifend. In vulputate porta lectus at pulvinar.",
        productSize: productSizes),
  );

var productImages = [
  "images/products/image_05.png",
  "images/products/image_05.jpg",
  "images/products/image_04.png",
];

var productMaterial = [
  "SS",
  "HT",
  "MS",
];

var productSizes = ["M8", "M10", "M12", "M14", "M16", "M18", "M20"];
