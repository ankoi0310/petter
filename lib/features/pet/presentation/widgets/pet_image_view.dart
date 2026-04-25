import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';

class PetImageView extends StatefulWidget {
  const PetImageView({super.key});

  @override
  State<PetImageView> createState() => _PetImageViewState();
}

class _PetImageViewState extends State<PetImageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  bool _liked = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scale =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: 1, end: 1.4),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 1.4, end: 0.88),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 0.88, end: 1),
            weight: 30,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    setState(() {
      _liked = !_liked;
    });

    await _controller.forward(from: 0);
  }

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
              image: Assets.images.pets.pet0.provider(),
              fit: .cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: _toggle,
            behavior: .opaque,
            child: ScaleTransition(
              scale: _scale,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: AppIconButton(
                  key: ValueKey(_liked),
                  icon: _liked ? Iconsax.heart : Iconsax.heart_copy,
                  iconColor: _liked
                      ? context.colors.error
                      : context.colors.onSurface,

                  borderRadius: .circular(16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
