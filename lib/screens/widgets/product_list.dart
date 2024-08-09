import 'package:flutter/material.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/screens/widgets/widgets.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (context, _) => const Divider(),
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    );
  }
}
