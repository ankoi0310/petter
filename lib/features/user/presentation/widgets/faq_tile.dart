import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/user/domain/entities/faq_item.dart';

class FaqTile extends StatefulWidget {
  const FaqTile({
    required this.item,
    required this.searchQuery,
    super.key,
  });

  final FaqItem item;
  final String searchQuery;

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  late final AnimationController _controller;
  late final Animation<double> _rotate;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _rotate = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    setState(() {
      _expanded = !_expanded;
    });

    await (_expanded ? _controller.forward() : _controller.reverse());
  }

  Widget _highlight(String text, TextStyle? base) {
    if (widget.searchQuery.isEmpty) return Text(text, style: base);

    final q = widget.searchQuery.toLowerCase();
    final spans = <TextSpan>[];
    var start = 0;
    while (true) {
      final idx = text.toLowerCase().indexOf(q, start);
      if (idx == -1) {
        spans.add(TextSpan(text: text.substring(start), style: base));
        break;
      }
      if (idx > start) {
        spans.add(
          TextSpan(text: text.substring(start, idx), style: base),
        );
      }
      spans.add(
        TextSpan(
          text: text.substring(idx, idx + q.length),
          style: base?.copyWith(
            backgroundColor: context.colors.primary.withValues(
              alpha: 0.2,
            ),
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      start = idx + q.length;
    }
    return RichText(text: TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const .only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          border: .all(
            color: _expanded
                ? context.colors.primary
                : context.colors.outline,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const .symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: _highlight(
                      widget.item.question,
                      context.textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(width: 8),
                  RotationTransition(
                    turns: _rotate,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),

            FadeTransition(
              opacity: _fade,
              child: SizeTransition(
                sizeFactor: _fade,
                axisAlignment: -1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colors.outlineVariant.withValues(
                      alpha: 0.8,
                    ),
                    borderRadius: const .only(
                      bottomLeft: .circular(14),
                      bottomRight: .circular(14),
                    ),
                  ),
                  padding: const .fromLTRB(16, 8, 16, 8),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Divider(
                        color: context.colors.primary.withValues(
                          alpha: 0.15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _highlight(
                        widget.item.answer,
                        context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
