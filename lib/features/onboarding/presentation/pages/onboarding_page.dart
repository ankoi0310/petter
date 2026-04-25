import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  int _currentIndex = 0;

  final images = <Widget>[
    Assets.images.welcome1.svg(fit: .fitWidth),
    Assets.images.welcome2.svg(fit: .fitWidth),
    Assets.images.welcome3.svg(fit: .fitWidth),
  ];

  final titles = [
    'Welcome to Petter - where kind hears meet their fur-ever friends. '
        'Start your journey today and give a loving soul the second chance it deserves.',
    'Find your paw-fect match on Petter. Explorer, connect, and adopt happiness-one wagging tail at a time.',
    'Every pet has a story, and you could be their favorite chapter. '
        'Join the Petter community and transform a rescued life into a beloved family member.',
  ];

  @override
  Widget build(BuildContext context) {
    print(context.colors.surfaceContainerHighest);
    print(context.colors.secondaryContainer);
    print(context.colors.tertiaryContainer);
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 24,
            children: [
              Align(
                alignment: .centerRight,
                child: TextButton(
                  onPressed: () => _controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize:
                          context.textTheme.titleMedium?.fontSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final image = images[index];
                    return Container(
                      padding: const .symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: .center,
                        spacing: 32,
                        children: [
                          Expanded(child: image),
                          Text(
                            titles[index],
                            textAlign: .center,
                            style: context.textTheme.titleMedium!
                                .copyWith(fontWeight: .bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    spacing: 16,
                    dotColor: context.colors.secondaryContainer,
                    activeDotColor: context.colors.secondary,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                  onDotClicked: (index) => _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: _currentIndex == 0
                    ? .end
                    : .spaceBetween,
                spacing: 16,
                children: [
                  if (_currentIndex > 0)
                    AppIconButton(
                      onTap: () => _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                      icon: Iconsax.arrow_left_2_copy,
                    ),
                  if (_currentIndex == 2) ...[
                    Expanded(
                      child: AppTextButton.outline(
                        context,
                        onTap: () {},
                        text: 'Sign Up',
                      ),
                    ),
                    Expanded(
                      child: AppTextButton(
                        onTap: () {},
                        text: 'Sign In',
                      ),
                    ),
                  ] else
                    AppIconButton(
                      onTap: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                      icon: Iconsax.arrow_right_3_copy,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
