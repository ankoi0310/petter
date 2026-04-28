import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';

class BottomActionWidget extends StatelessWidget {
  const BottomActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 16,
        children: [
          GestureDetector(
            onTap: context.pop,
            child: AppIconButton(
              icon: Iconsax.arrow_left_2_copy,
              padding: const .all(12),
              borderRadius: .circular(16),
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: context.colors.onPrimaryContainer,
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          AppIconButton(
            icon: Iconsax.call_copy,
            padding: const .all(12),
            borderRadius: .circular(16),
            border: Border.all(),
            boxShadow: [
              BoxShadow(
                color: context.colors.onPrimaryContainer,
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          AppIconButton(
            // handle create conversation first
            onTap: () => context.pushNamed(AppRoutes.chat.name),
            icon: Iconsax.messages_2_copy,
            padding: const .all(12),
            borderRadius: .circular(16),
            border: Border.all(),
            boxShadow: [
              BoxShadow(
                color: context.colors.onPrimaryContainer,
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          Expanded(
            // handle adopt function
            child: AppIconButton(
              icon: Iconsax.pet_copy,
              padding: const .all(12),
              borderRadius: .circular(16),
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: context.colors.onPrimaryContainer,
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
