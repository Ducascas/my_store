import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/core/services/database_service.dart';
import 'package:my_store/models/product.dart';

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final notifier = ProductNotifier();
  notifier.loadProducts();
  return notifier;
});

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);
  List<Product> _allProducts = [];

  Future<void> loadProducts() async {
    // await DatabaseService().clearDatabase();

    try {
      final dbProducts = await DatabaseService().getProducts();
      if (dbProducts.isEmpty) {
        final jsonString =
            await rootBundle.loadString('assets/json/dummy_data.json');
        final List<dynamic> jsonData = jsonDecode(jsonString);
        final List<Product> products =
            jsonData.map((data) => Product.fromMap(data)).toList();

        for (var product in products) {
          await DatabaseService().insertProduct(product);
        }
        _allProducts = products;
        state = products;
      } else {
        _allProducts = dbProducts;
        state = dbProducts;
      }
    } catch (e) {
      log('Error loading products: $e');
    }
  }

  Future<void> toggleFavorite(Product product) async {
    try {
      final updatedProduct = Product(
        id: product.id,
        name: product.name,
        description: product.description,
        imageUrl: product.imageUrl,
        isFavorite: !product.isFavorite,
      );

      await DatabaseService().updateProduct(updatedProduct);

      state = [
        for (final product in state)
          if (product.id == updatedProduct.id) updatedProduct else product,
      ];
    } catch (e) {
      log('Error toggling favorite: $e');
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      state = _allProducts;
    } else {
      state = _allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
