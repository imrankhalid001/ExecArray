class Product {
  final int id;
  final String name;
  final String imagePath;
  final double salePrice;
  final double rentPrice;
  final String productDescraption;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.salePrice,
    required this.rentPrice,
    required this.productDescraption,
  });

  // Convert a Product into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'salePrice': salePrice,
      'rentPrice': rentPrice,
      'productDescraption': productDescraption,
    };
  }

  // A method that converts a map into a Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
      salePrice: map['salePrice'],
      rentPrice: map['rentPrice'],
      productDescraption: map['productDescraption'],
    );
  }
}
