import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    required this.petId,
    this.iconSize,
    this.padding,
    this.borderRadius,
    super.key,
  });

  final String petId;
  final double? iconSize;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

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

  Future<void> _toggle(bool currentLikedStatus) async {
    await context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) {
        // Chạy animation ngay lập tức
        _controller.forward(from: 0);

        context.read<FavoriteBloc>().add(
          FavoriteEvent.toggleFavorite(
            FavoriteParams(uid: user.uid, petId: widget.petId),
          ),
        );
      },
      unauthenticated: () => context.pushNamed(AppRoutes.signIn.name),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final isLiked = context.select<FavoriteBloc, bool>((bloc) {
          return bloc.state.maybeWhen(
            loaded: (favorites) {
              return favorites.any((p) => p.petId == widget.petId);
            },
            orElse: () => false,
          );
        });

        return GestureDetector(
          onTap: () => _toggle(isLiked),
          behavior: .opaque,
          child: ScaleTransition(
            scale: _scale,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: AppIconButton(
                key: ValueKey(isLiked),
                icon: isLiked ? Iconsax.heart : Iconsax.heart_copy,
                iconSize: widget.iconSize,
                iconColor: isLiked
                    ? context.colors.error
                    : context.colors.onSurface,
                padding: widget.padding,
                borderRadius: widget.borderRadius ?? .circular(16),
              ),
            ),
          ),
        );
      },
    );
  }
}
