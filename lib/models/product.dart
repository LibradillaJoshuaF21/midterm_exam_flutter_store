class Product {
  int id;
  String title;
  double price;
  String category;
  String description;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> item) {
    return Product(
      id: int.parse(item['id']),
      title: item['title'],
      price: double.parse(item['price']),
      category: item['category'],
      description: item['description'],
      image: item['image'],
    );
  }
}
