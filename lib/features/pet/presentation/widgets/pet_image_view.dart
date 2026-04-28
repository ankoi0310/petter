import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/button.dart';

class PetImageView extends StatelessWidget {
  const PetImageView({required this.imageUrl, super.key});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.width - 16 * 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.primary,
              width: 2,
            ),
            borderRadius: .circular(32),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: .cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: LikeButton(onTap: () {}),
        ),
      ],
    );
  }
}
