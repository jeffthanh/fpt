import 'dart:convert';

class Product {
  int? id;
  String name;
  String image;
  int price;
  String description;
  int? categoryid;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.categoryid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'categoryid': categoryid,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      categoryid: map['categoryid'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
