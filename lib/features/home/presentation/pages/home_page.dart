import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:petter/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:petter/features/home/presentation/widgets/home_species_section.dart';
import 'package:petter/features/notification/presentation/bloc/notification_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationBloc>().add(const .getNotifications());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petter'),
        actionsPadding: const .only(right: 16),
        actionsIconTheme: const IconThemeData(size: 20),
        actions: [
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.search.name),
            child: const AppIconButton(
              icon: Iconsax.search_normal_copy,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () =>
                context.pushNamed(AppRoutes.notification.name),
            child: const AppIconButton(
              icon: Iconsax.notification_copy,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.chat.name),
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
              const HomeSpeciesSection(),
              const Expanded(child: HomeCarouselSlider()),
              const HomeBottomNav(),
            ],
          ),
        ),
      ),
    );
  }
}
