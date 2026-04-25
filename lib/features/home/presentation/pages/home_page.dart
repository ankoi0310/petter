import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/home/presentation/widgets/bottom_nav.dart';
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
              ),
              const HomeCategoryWidget(),
              const Expanded(child: HomeCarouselSlider()),
              const BottomNav(),
            ],
          ),
        ),
      ),
    );
  }
}
