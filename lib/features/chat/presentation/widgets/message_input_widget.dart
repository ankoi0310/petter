import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({super.key});

  @override
  State<MessageInputWidget> createState() =>
      _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  bool _isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Messages',
                hintStyle: TextStyle(color: context.colors.outline),
                filled: true,
                fillColor: context.colors.surface,
                border: OutlineInputBorder(
                  borderRadius: .circular(16),
                ),
                contentPadding: const .symmetric(horizontal: 8),
              ),
              onTap: () {
                setState(() {
                  _isFocus = true;
                });
              },
              onTapOutside: (event) {
                setState(() {
                  _isFocus = false;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  _isFocus = false;
                });
              },
            ),
          ),
          if (!_isFocus) ...[
            const Icon(Iconsax.gallery_copy),
            const Icon(Iconsax.camera_copy),
            const Icon(Iconsax.microphone_2_copy),
          ],
        ],
      ),
    );
  }
}
