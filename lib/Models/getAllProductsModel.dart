class GetAllProductsModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  const GetAllProductsModel({
    required this.rating,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory GetAllProductsModel.fromJson(json) {
    return GetAllProductsModel(
      id: json['id'],
      title: json['title'],
      price: json["price"],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] == null ? null : Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final dynamic rate;
  final int count;

  const Rating({required this.rate, required this.count});
  factory Rating.fromJson(json) {
    return Rating(rate: json["rate"], count: json["count"]);
  }
}
