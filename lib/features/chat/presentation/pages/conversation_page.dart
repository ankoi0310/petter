import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        titleSpacing: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchSliverDelegate(),
            ),
            SliverList.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => context.pushNamed(
                    AppRoutes.chat.name,
                    pathParameters: {'id': '$index'},
                  ),
                  horizontalTitleGap: 12,
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: .all(),
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      child: ClipRRect(
                        borderRadius: .circular(24),
                        child: Assets.images.categories.cat.image(
                          fit: .cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text('User $index'),
                  subtitle: const Text("What's up man?"),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 1, thickness: 2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => kToolbarHeight + 24;

  @override
  double get minExtent => kToolbarHeight + 24;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow.withValues(alpha: .8),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search messages...',
          suffixIcon: const Icon(Iconsax.search_normal_copy),
          border: OutlineInputBorder(borderRadius: .circular(16)),
        ),
      ),
    );
  }
}
