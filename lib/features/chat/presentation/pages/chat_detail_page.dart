import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/entities/message.dart';
import 'package:petter/features/chat/presentation/bloc/chat_message/chat_message_bloc.dart';
import 'package:petter/features/chat/presentation/widgets/message_input_widget.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    required this.id,
    required this.room,
    super.key,
  });

  final String id;
  final ChatRoom room;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<ChatMessageBloc>().add(
      ChatMessageEvent.messageSent(text),
    );
    FocusScope.of(context).unfocus();
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => '',
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.room.id), titleSpacing: 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Expanded(
              child: BlocConsumer<ChatMessageBloc, ChatMessageState>(
                buildWhen: (prev, curr) => curr.maybeWhen(
                  loading: () => true,
                  loaded: (_) => true,
                  orElse: () => false,
                ),
                listener: (context, state) {
                  state.whenOrNull(
                    failure: (failure) {
                      print(failure.message);
                      showSnackBar(context, content: failure.message);
                    },
                  );
                },
                builder: (context, state) => state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (messages) => _MessageList(
                    messages: messages,
                    currentUid: currentUid,
                    scrollController: _scrollController,
                  ),
                  failure: (_) => const SizedBox(),
                ),
              ),
            ),
            MessageInputWidget(
              controller: _controller,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Stack(
          clipBehavior: .none,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: .circle,
                border: .all(),
              ),
              child: CircleAvatar(
                radius: 20,
                child: ClipRRect(
                  borderRadius: .circular(20),
                  child: Assets.images.categories.cat.image(
                    fit: .cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: .circle,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text('Koi', style: context.textTheme.bodyLarge),
            Text('Online', style: context.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}

class _MessageList extends StatefulWidget {
  const _MessageList({
    required this.messages,
    required this.currentUid,
    required this.scrollController,
  });

  final List<Message> messages;
  final String currentUid;
  final ScrollController scrollController;

  @override
  State<_MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<_MessageList> {
  @override
  void didUpdateWidget(_MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Scroll xuống cuối khi có tin nhắn mới
    if (widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.scrollController.hasClients) {
          widget.scrollController.animateTo(
            widget.scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      itemCount: widget.messages.length,
      itemBuilder: (_, i) => _MessageBubble(
        message: widget.messages[i],
        isMe: widget.messages[i].senderId == widget.currentUid,
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message, required this.isMe});

  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.72,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? context.colors.primary
              : context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isMe ? 18 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 18),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isMe
                ? context.colors.onPrimary
                : context.colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
