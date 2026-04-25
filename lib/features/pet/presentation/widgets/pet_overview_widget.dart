import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';

class PetInfoWidget extends StatelessWidget {
  const PetInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .center,
                spacing: 4,
                children: [
                  Text('Max', style: context.textTheme.titleLarge),
                  Row(
                    spacing: 4,
                    children: [
                      Assets.icons.mapPin.svg(width: 16),
                      Text(
                        "Max's address",
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppButton(
              child: Assets.icons.male.svg(
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  context.colors.primary,
                  .srcIn,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const .symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            border: Border.all(),
            borderRadius: .circular(20),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow.withValues(alpha: .8),
                blurStyle: BlurStyle.solid,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    children: [
                      Text('Age', style: context.textTheme.bodyLarge),
                      Text(
                        '1 year 5 month',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: context.colors.onSurface,
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    children: [
                      Text(
                        'Weight',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '3.5kg',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
