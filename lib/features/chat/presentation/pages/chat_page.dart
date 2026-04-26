import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/features/chat/presentation/widgets/message_input_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
        ),
        titleSpacing: 0,
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [
            Expanded(child: Center(child: Text('Chat messages'))),
            MessageInputWidget(),
          ],
        ),
      ),
    );
  }
}
