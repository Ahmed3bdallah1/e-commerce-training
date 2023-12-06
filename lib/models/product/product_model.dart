import 'package:e_commerce_training/models/product/laptop_modl.dart';

class ProductModel {
  String status;
  String message;
  List<LaptopModel> product;

  ProductModel({
    required this.status,
    required this.message,
    required this.product,
  });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        product:
            List<LaptopModel>.from(json["product"].map((x) => LaptopModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}
