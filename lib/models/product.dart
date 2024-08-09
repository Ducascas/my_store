class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      isFavorite: map['isFavorite'] == 1,
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
