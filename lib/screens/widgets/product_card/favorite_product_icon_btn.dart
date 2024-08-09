import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/providers/products_provider.dart';

class FavoriteProductIconBtn extends ConsumerWidget {
  const FavoriteProductIconBtn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsNotifier = ref.read(productsProvider.notifier);

    return IconButton(
      icon: Icon(
        product.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: product.isFavorite ? Colors.red : null,
      ),
      onPressed: () => productsNotifier.toggleFavorite(product),
    );
  }
}
