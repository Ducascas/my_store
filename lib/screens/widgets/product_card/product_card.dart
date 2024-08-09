import 'package:flutter/material.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/screens/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageBox(imageUrl: product.imageUrl),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameProductText(name: product.name),
              DescProductText(description: product.description),
            ],
          ),
        ),
        const SizedBox(width: 10),
        FavoriteProductIconBtn(product: product)
      ],
    );
  }
}
