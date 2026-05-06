import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() =>
      _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  late PageController _pageController;
  double _pageOffset = 0;
  final int _virtualCount = 10000;
  final int _realCount = 10;

  @override
  void initState() {
    super.initState();
    context.read<PetBloc>().add(
      .getPets(params: PetFilterParams(limit: _realCount)),
    );

    final middle = _virtualCount ~/ 2;
    final initialPage = middle - (middle % _realCount);

    _pageOffset = initialPage.toDouble();
    _pageController =
        PageController(
          viewportFraction: 0.6,
          initialPage: initialPage,
        )..addListener(() {
          setState(() {
            _pageOffset = _pageController.page ?? 0;
          });
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _virtualCount,
      itemBuilder: (context, index) {
        final actualIndex = index % _realCount;
        final diff = index - _pageOffset;

        // Animation values
        final radian = diff * 0.25; // Độ xoay
        final ty = diff.abs() * 30; // Độ rơi xuống tạo vòng cung
        final scale = 1 - (diff.abs() * 0.15); // Độ phóng to/thu nhỏ
        final opacity = (1 - diff.abs()).clamp(
          0.3,
          1.0,
        ); // Làm mờ các mục ở xa

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Hiệu ứng 3D
            ..translateByVector3(Vector3(0, ty, 0))
            ..rotateZ(radian)
            ..scaleByVector3(Vector3(scale, scale, 1)),
          child: Opacity(
            opacity: opacity,
            child: _buildCard(actualIndex),
          ),
        );
      },
    );
  }

  Widget _buildCard(int index) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (homePets, searchPets, myPets, _) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 32,
              ),
              child: Stack(
                children: [
                  PetCard(pet: homePets[index]),
                  if (homePets[index].isAdopted)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const .all(8),
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: const .only(
                            topLeft: .circular(16),
                            bottomRight: .circular(16),
                          ),
                          border: Border.all(
                            color: context.colors.primary,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Đã được nhận nuôi',
                          style: context.textTheme.labelMedium
                              ?.copyWith(
                                color: context.colors.onPrimary,
                              ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
