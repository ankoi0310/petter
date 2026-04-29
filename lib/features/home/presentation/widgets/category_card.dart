import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/category/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: .circle,
        border: Border.all(color: context.colors.secondary),
      ),
      child: CircleAvatar(
        radius: 32,
        child: ClipRRect(
          borderRadius: .circular(32),
          child: CachedNetworkImage(
            cacheKey: category.id,
            imageUrl: category.imageUrl,
            memCacheHeight: 200,
            memCacheWidth: 200,
            fadeInDuration: const Duration(milliseconds: 300),
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Container(color: context.colors.primaryContainer),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
