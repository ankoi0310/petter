import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    required this.title,
    this.onTap,
    this.trailing,
    super.key,
  });

  final VoidCallback? onTap;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      tileColor: context.colors.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: context.colors.outline),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      trailing: trailing,
    );
  }
}
