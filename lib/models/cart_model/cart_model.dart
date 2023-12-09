class CartModel {
  final List<CartProduct>? products;

  CartModel({required this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromJson(x))),
      );
}

class CartProduct {
  String id;
  String status;
  String category;
  String name;
  double price;
  String description;
  String image;
  List images;
  String company;
  int countInStock;
  int v;
  int quantity;
  int sales;
  double totalPrice;

  CartProduct(
      {required this.id,
      required this.status,
      required this.category,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.images,
      required this.company,
      required this.countInStock,
      required this.v,
      required this.quantity,
      required this.sales,
      required this.totalPrice});

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["_id"],
        status: json["status"]!,
        category: json["category"]!,
        name: json["name"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        image: json["image"],
        images: json["images"],
        company: json["company"],
        countInStock: json["countInStock"],
        v: json["__v"],
        quantity: json["quantity"],
        sales: json["sales"],
        totalPrice: json["totalPrice"],
      );
}
