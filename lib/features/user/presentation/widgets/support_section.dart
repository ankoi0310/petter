import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/user/presentation/widgets/menu_item_tile.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          'Hỗ trợ người dùng',
          style: context.textTheme.titleLarge,
        ),
        Column(
          spacing: 4,
          children: [
            MenuItemTile(
              onTap: () {},
              title: 'Câu hỏi thường gặp',
              trailing: const Icon(Icons.question_answer_outlined),
            ),
            MenuItemTile(
              onTap: () {},
              title: 'Báo lỗi',
              trailing: const Icon(Icons.report_outlined),
            ),
            MenuItemTile(
              onTap: () {},
              title: 'Đánh giá ứng dụng',
              trailing: const Icon(Icons.feedback_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
