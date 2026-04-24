import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/home/presentation/widgets/home_carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petter'),
        actionsPadding: const .only(right: 16),
        actionsIconTheme: const IconThemeData(size: 20),
        actions: const [
          AppIconButton(icon: Iconsax.search_normal_copy),
          SizedBox(width: 16),
          AppIconButton(icon: Iconsax.sms_notification_copy),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            spacing: 16,
            children: [
              Container(
                width: .infinity,
                height: 180,
                margin: const .symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: .circular(32),
                  border: Border.all(color: context.colors.primary),
                  image: DecorationImage(
                    image: Assets.images.banner.provider(),
                    fit: .cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Banner',
                    style: TextStyle(color: context.colors.onPrimary),
                  ),
                ),
              ),
              Padding(
                padding: const .symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: .stretch,
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: context.textTheme.titleLarge,
                        ),
                        const Icon(Iconsax.arrow_right_copy),
                      ],
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: List.generate(4, (index) {
                          return Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    context.colors.primaryContainer,
                                shape: .circle,
                              ),
                              child: CircleAvatar(
                                radius: 32,
                                child: ClipRRect(
                                  borderRadius: .circular(32),
                                  child: Image.network(
                                    'https://robohash.org/$index',
                                    fit: .fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: HomeCarouselSlider()),
              Container(
                margin: const .symmetric(horizontal: 16),
                padding: const .symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: .circular(16),
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.onPrimaryContainer,
                      blurRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Icon(Iconsax.home_2_copy),
                    Icon(Iconsax.message_copy),
                    Icon(Iconsax.add_square_copy),
                    Icon(Iconsax.heart_copy),
                    Icon(Iconsax.pet_copy),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
