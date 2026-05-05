import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

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
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () {},
              leading: const Icon(Icons.question_answer_outlined),
              title: const Text('Câu hỏi thường gặp'),
            ),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () {},
              leading: const Icon(Icons.report_outlined),
              title: const Text('Báo lỗi'),
            ),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () {},
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Đánh giá ứng dụng'),
            ),
          ],
        ),
      ],
    );
  }
}
