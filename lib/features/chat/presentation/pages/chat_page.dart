import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/presentation/bloc/chat_room/chat_room_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuộc trò chuyện'),
        titleSpacing: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<ChatRoomBloc, ChatRoomState>(
        buildWhen: (_, curr) => curr.maybeWhen(
          roomReady: (_) => false,
          orElse: () => true,
        ),
        listenWhen: (_, curr) => curr.maybeWhen(
          roomReady: (_) => true,
          failure: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox(),
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            loaded: (rooms) {
              if (rooms.isEmpty) {
                return const Padding(
                  padding: .all(16),
                  child: Center(
                    child: Text('Bạn chưa có cuộc trò chuyện nào'),
                  ),
                );
              } else {
                return SafeArea(
                  child: ListView.separated(
                    padding: const .symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      return ChatRoomTile(room: rooms[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 1, thickness: 2);
                    },
                  ),
                );
              }
            },
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  const ChatRoomTile({required this.room, super.key});

  final ChatRoom room;

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => '',
    );

    final otherUserId = room.memberIds.firstWhere(
      (id) => id != currentUid,
    );
    final avatar = room.memberAvatars[otherUserId] ?? '';
    final name = room.memberNames[otherUserId] ?? 'Người dùng Petter';
    final unread = room.unreadCount[currentUid] ?? 0;

    return ListTile(
      onTap: () => context.pushNamed(
        AppRoutes.chatDetail.name,
        pathParameters: {'id': room.id},
        extra: room,
      ),
      leading: Container(
        decoration: BoxDecoration(shape: .circle, border: .all()),
        child: CircleAvatar(
          radius: 24,
          child: ClipRRect(
            borderRadius: .circular(24),
            child: CachedNetworkImage(imageUrl: avatar, fit: .cover),
          ),
        ),
      ),
      title: Text(name, maxLines: 1, overflow: .ellipsis),
      subtitle: Text(
        room.lastMessage ?? '',
        maxLines: 1,
        overflow: .ellipsis,
      ),
      trailing: unread > 0
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                '$unread',
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            )
          : null,
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
