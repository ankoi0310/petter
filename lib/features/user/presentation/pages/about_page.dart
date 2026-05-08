import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giới thiệu')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const .fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const .all(16),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '🐾',
                        style: TextStyle(
                          fontSize: 40,
                          color: context.colors.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Chào mừng bạn đến với\nPetter!',
                      textAlign: .center,
                      style: context.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nơi kết nối những trái tim yêu thương\nvới những '
                      'chú thú cưng cần mái ấm.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Chúng tôi làm gì?',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.primary,
                ),
              ),
              const _FeatureCard(
                emoji: '🐶',
                title: 'Đăng tin nhận nuôi',
                desc:
                    'Đang cứu trợ hoặc tạm nuôi một bé? '
                    'Đăng tin để tìm gia đình mới tốt bụng cho bé.',
              ),
              const _FeatureCard(
                emoji: '🏠',
                title: 'Tìm kiếm & gửi yêu cầu',
                desc:
                    'Duyệt các bé đang cần nhận nuôi, '
                    'gửi yêu cầu và trao đổi trực tiếp với người đăng.',
              ),
              const _FeatureCard(
                emoji: '💬',
                title: 'Nhắn tin trực tiếp',
                desc:
                    'Hỏi thăm tình trạng của bé và sắp xếp gặp gỡ '
                    'dễ dàng qua tính năng chat trong app.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Dù bạn là người muốn nhận nuôi, đang cứu trợ thú cưng, '
                'hay chỉ muốn chung tay lan toả yêu thương — '
                'Pet Adoption là nơi dành cho bạn. 🐾',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const .only(bottom: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: const .all(16),
        child: Row(
          spacing: 16,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(title, style: context.textTheme.titleSmall),
                  Text(desc, style: context.textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
