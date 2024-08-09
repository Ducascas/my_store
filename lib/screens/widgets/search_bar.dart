import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/providers/products_provider.dart';

class SearchAppBar extends ConsumerWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsNotifier = ref.read(productsProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: AppConstants.search,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (query) => productsNotifier.searchProducts(query),
      ),
    );
  }
}
