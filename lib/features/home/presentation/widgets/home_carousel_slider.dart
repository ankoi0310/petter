import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() =>
      _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;
  double _pageOffset = 0;
  final int _virtualCount = 200;
  final int _realCount = 10;

  // Cached animation values to avoid recalculation
  final Map<int, _AnimationValues> _animationCache = {};

  // Static variable to persist position across app navigation
  static double? _persistentPagePosition;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    final initialPage =
        _persistentPagePosition?.toInt() ??
        (_virtualCount ~/ 2 - (_virtualCount ~/ 2 % _realCount));

    _pageOffset = initialPage.toDouble();

    _pageController = PageController(
      viewportFraction: 0.6,
      initialPage: initialPage,
    )..addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // Store the current page position persistently
    _persistentPagePosition = _pageController.page ?? _pageOffset;
    _pageController.dispose();
    _animationCache.clear();
    super.dispose();
  }

  // Debounced page change handler
  void _onPageChanged() {
    if (_pageController.hasClients) {
      setState(() {
        _pageOffset = _pageController.page ?? 0;
        _animationCache.clear();
      });
    }
  }

  // Cached animation calculation
  _AnimationValues _getAnimationValues(int index) {
    return _animationCache[index] ??= _calculateAnimationValues(
      index,
    );
  }

  _AnimationValues _calculateAnimationValues(int index) {
    final diff = index - _pageOffset;
    final radian = diff * 0.25;
    final ty = diff.abs() * 30;
    final scale = 1 - (diff.abs() * 0.15);
    final opacity = (1 - diff.abs()).clamp(0.3, 1.0);

    return _AnimationValues(
      radian: radian,
      ty: ty,
      scale: scale,
      opacity: opacity,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PetBloc, PetState>(
      buildWhen: (previous, current) {
        // Only rebuild when pets data actually changes
        return current.maybeWhen(
          loaded: (homePets, _, _, _) {
            final prevPets = previous.maybeWhen(
              loaded: (prevHomePets, _, _, _) => prevHomePets,
              orElse: () => <Pet>[],
            );
            return homePets != prevPets;
          },
          orElse: () => true,
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (homePets, searchPets, myPets, _) {
            if (homePets.isEmpty) return const SizedBox.shrink();

            return RepaintBoundary(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _virtualCount,
                itemBuilder: (context, index) {
                  final actualIndex = index % homePets.length;
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      final animationValues = _getAnimationValues(
                        index,
                      );
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translateByVector3(
                            Vector3(0, animationValues.ty, 0),
                          )
                          ..rotateZ(animationValues.radian)
                          ..scaleByVector3(
                            Vector3(
                              animationValues.scale,
                              animationValues.scale,
                              1,
                            ),
                          ),
                        child: Opacity(
                          opacity: animationValues.opacity,
                          child: _buildCard(
                            homePets[actualIndex],
                            actualIndex,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildCard(Pet pet, int index) {
    return Container(
      key: ValueKey(pet.id),
      margin: const .symmetric(horizontal: 8, vertical: 32),
      child: Stack(
        children: [
          Positioned.fill(
            child: PetCard(pet: pet, key: ValueKey(pet.id)),
          ),
          if (pet.isAdopted)
            const Positioned(top: 0, left: 0, child: _AdoptedBadge()),
        ],
      ),
    );
  }
}

// Immutable animation values class
class _AnimationValues {
  const _AnimationValues({
    required this.radian,
    required this.ty,
    required this.scale,
    required this.opacity,
  });

  final double radian;
  final double ty;
  final double scale;
  final double opacity;
}

// Extracted widget for better performance
class _AdoptedBadge extends StatelessWidget {
  const _AdoptedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: context.colors.primary, width: 2),
      ),
      child: Text(
        'Đã được nhận nuôi',
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.onPrimary,
        ),
      ),
    );
  }
}
