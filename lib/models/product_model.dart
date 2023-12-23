class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final String image;
  final double price;
  final RatingModel rating;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData['category'],
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
