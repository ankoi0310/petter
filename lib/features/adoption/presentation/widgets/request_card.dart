import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/date_time_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/positioned_bottom_shadow.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({required this.request, super.key});

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.adoptionRequestDetail.name,
        extra: request,
      ),
      child: Stack(
        children: [
          Container(
            padding: const .symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              borderRadius: .circular(24),
              border: Border.all(),
            ),
            child: IntrinsicHeight(
              child: Row(
                spacing: 8,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: .all(
                            color: context.colors.primary,
                            width: 2,
                          ),
                          borderRadius: .circular(12),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              request.petImageUrl,
                            ),
                            fit: .cover,
                          ),
                        ),
                      ),
                      PositionedBottomShadow(
                        padding: const .symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          request.petName,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(
                                color:
                                    context.colors.tertiaryContainer,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      spacing: 4,
                      children: [
                        Row(
                          spacing: 4,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text('Adopter:'),
                            Text(
                              request.adopterName,
                              style: context.textTheme.bodyMedium!
                                  .copyWith(fontWeight: .bold),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text('Phone:'),
                            Text(
                              request.adopterPhone,
                              style: context.textTheme.bodyMedium!
                                  .copyWith(fontWeight: .bold),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text('Created at:'),
                            Text(
                              request.createdAt.fullTimeDate,
                              style: context.textTheme.bodyMedium!
                                  .copyWith(fontWeight: .bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const .symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: context.colors.tertiaryContainer,
                borderRadius: const .only(
                  topLeft: .circular(24),
                  bottomRight: .circular(24),
                ),
                border: Border.all(),
              ),
              child: Text(
                request.status.label,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
