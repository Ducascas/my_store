import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/providers/products_provider.dart';
import 'package:my_store/screens/widgets/widgets.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref
        .watch(productsProvider)
        .where((product) => product.isFavorite)
        .toList();

    return Scaffold(
      appBar: AppBar(),
      body: ProductList(products: products),
    );
  }
}
