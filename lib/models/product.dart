class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final String description;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFeatured;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    required this.description,
    required this.category,
    this.rating = 4.5,
    this.reviewCount = 0,
    this.isFeatured = false,
  });

  int get discountPercent {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).round();
  }
}

class Category {
  final String id;
  final String name;
  final String icon;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
