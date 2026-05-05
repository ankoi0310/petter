import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/positioned_bottom_shadow.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';

class PetInfoSection extends StatelessWidget {
  const PetInfoSection({required this.request, super.key});

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(right: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Padding(
            padding: const .only(left: 16),
            child: Text(
              'Thông tin thú cưng',
              style: context.textTheme.titleLarge,
            ),
          ),
          Container(
            padding: const .all(16),
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              border: const Border(
                top: BorderSide(),
                right: BorderSide(),
                bottom: BorderSide(),
              ),
              borderRadius: const .only(
                topRight: .circular(32),
                bottomRight: .circular(32),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colors.primary,
                      width: 2,
                    ),
                    borderRadius: .circular(16),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        request.petImageUrl,
                      ),
                      fit: .cover,
                    ),
                  ),
                ),
                PositionedBottomShadow(
                  child: Text(
                    request.petName,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.tertiaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
