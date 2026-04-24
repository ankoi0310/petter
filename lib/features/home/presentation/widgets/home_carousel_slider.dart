import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    int middle = _virtualCount ~/ 2;
    int initialPage = middle - (middle % _realCount);

    _pageOffset = initialPage.toDouble();
    _pageController =
        PageController(
          viewportFraction: 0.4,
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
        int actualIndex = index % _realCount;
        double diff = index - _pageOffset;

        // Animation values
        double radian = diff * 0.25; // Độ xoay
        double ty = diff.abs() * 40; // Độ rơi xuống tạo vòng cung
        double scale = 1 - (diff.abs() * 0.15); // Độ phóng to/thu nhỏ
        double opacity = (1 - diff.abs()).clamp(
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
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text("Quote #$index")),
    );
  }
}
