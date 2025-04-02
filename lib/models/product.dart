class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  // Convert a Product into a Map. The keys must correspond to the names of the fields in the database table.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      "description":description,
      'imagePath': imagePath,
    };
  }

  // A method that converts a Map into a Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imagePath: json['imagePath'],
    );
  }
}
