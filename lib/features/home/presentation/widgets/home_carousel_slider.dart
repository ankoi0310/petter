import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
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

  // Tổng số item ảo để tạo cảm giác vô hạn
  final int _virtualCount = 10000;

  // Số lượng dữ liệu thực tế (ví dụ bạn có 10 câu triết lý)
  final int _realCount = 10;

  final List<AssetGenImage> pets = Assets.images.pets.values.toList();

  @override
  void initState() {
    super.initState();
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
    return Stack(
      children: [
        GestureDetector(
          excludeFromSemantics: true,
          onTap: () => context.pushNamed(
            AppRoutes.petInfo.name,
            pathParameters: {'id': '$index'},
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 32,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.colors.primary.withValues(alpha: .5),
                width: 2,
              ),
              image: DecorationImage(
                image: pets[index].provider(),
                fit: .cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: LikeButton(onTap: () {}),
        ),
      ],
    );
  }
}
