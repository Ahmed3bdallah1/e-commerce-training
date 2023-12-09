class LaptopModel {
  String id;
  String status;
  String category;
  String name;
  double price;
  String description;
  String image;
  List<String> images;
  String company;
  int countInStock;
  int v;
  int sales;

  LaptopModel({
    required this.id,
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
    required this.sales,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) => LaptopModel(
        id: json["_id"],
        status: json["status"]!,
        category: json["category"]!,
        name: json["name"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        image: json["image"],
        images: List<String>.from(json["images"].map((image) => image)),
        company: json["company"],
        countInStock: json["countInStock"],
        v: json["__v"],
        sales: json["sales"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "category": category,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "images": List<dynamic>.from(images.map((x) => x)),
        "company": company,
        "countInStock": countInStock,
        "__v": v,
        "sales": sales,
      };
}
