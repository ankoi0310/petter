import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:petter/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:petter/features/home/presentation/widgets/home_category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petter'),
        actionsPadding: const .only(right: 16),
        actionsIconTheme: const IconThemeData(size: 20),
        actions: [
          GestureDetector(
            onTap: () =>
                context.pushNamed(AppRoutes.notification.name),
            child: const AppIconButton(
              icon: Iconsax.notification_copy,
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () =>
                context.pushNamed(AppRoutes.conversation.name),
            child: const AppIconButton(
              icon: Iconsax.sms_notification_copy,
            ),
          ),
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
              ),
              const HomeCategoryWidget(),
              const Expanded(child: HomeCarouselSlider()),
              const HomeBottomNav(),
            ],
          ),
        ),
      ),
    );
  }
}
