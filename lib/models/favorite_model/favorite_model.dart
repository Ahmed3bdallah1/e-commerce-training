class FavoriteModel {
  final List<FavoriteProducts>? products;

  FavoriteModel({required this.products});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        products: List<FavoriteProducts>.from(
            json["favoriteProducts"].map((x) => FavoriteProducts.fromJson(x))),
      );
}

class FavoriteProducts {
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
  int sales;

  FavoriteProducts(
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
      required this.sales});

  factory FavoriteProducts.fromJson(Map<String, dynamic> json) =>
      FavoriteProducts(
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
        sales: json["sales"],
      );
}
