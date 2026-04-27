import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';

class MyPetPage extends StatelessWidget {
  const MyPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your pets'),
        titleSpacing: 0,
        actionsPadding: const .only(right: 16),
        actions: [
          AppIconButton(
            onTap: () => context.pushNamed(AppRoutes.myPetAdd.name),
            icon: Iconsax.add_copy,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(
                    AppRoutes.myPetInfo.name,
                    queryParameters: {'id': '$index'},
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: Assets
                            .images
                            .pets
                            .values[index %
                                Assets.images.pets.values.length]
                            .provider(),
                        fit: .cover,
                      ),
                      border: Border.all(
                        color: context.colors.primary,
                        width: 2,
                      ),
                      borderRadius: .circular(16),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                      gradient: LinearGradient(
                        begin: .bottomCenter,
                        end: .topCenter,
                        colors: [
                          Colors.black.withValues(alpha: .7),
                          Colors.black.withValues(alpha: .5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Text(
                      'Max',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.surface,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: LikeButton(
                    onTap: () {},
                    iconSize: 16,
                    borderRadius: .circular(12),
                  ),
                ),

                Positioned(
                  bottom: 8,
                  right: 8,
                  child: AppIconButton(
                    onTap: () {},
                    icon: Iconsax.edit_2_copy,
                    iconSize: 16,
                    borderRadius: .circular(12),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
