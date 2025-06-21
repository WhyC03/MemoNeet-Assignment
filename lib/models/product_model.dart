class Product {
  final String id;
  final String productName;
  final int actualPrice;
  final int discountedPrice;
  final int discount;
  final String productDetails;
  final bool purchased;
  final String imagePath;
  final String examCategory; // Keep NEET 2024 / NEET 2025 as-is
  final List<String> tags; // <-- Use this for Biology, Notes, etc.

  Product({
    required this.id,
    required this.productName,
    required this.actualPrice,
    required this.discountedPrice,
    required this.discount,
    required this.productDetails,
    required this.purchased,
    required this.imagePath,
    required this.examCategory,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productName: json['productName'],
      actualPrice: json['actualPrice'],
      discountedPrice: json['discountedPrice'],
      discount: json['discount'],
      productDetails: json['productDetails'],
      purchased: json['purchased'],
      imagePath: json['imagePath'],
      examCategory: json['examCategory'],
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'actualPrice': actualPrice,
      'discountedPrice': discountedPrice,
      'discount': discount,
      'productDetails': productDetails,
      'purchased': purchased,
      'imagePath': imagePath,
      'examCategory': examCategory,
      'tags': tags,
    };
  }
}
