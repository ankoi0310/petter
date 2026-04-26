import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 8,
            children: [
              const Text('Mark all as read', textAlign: .end),
              Column(
                spacing: 12,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Today',
                        style: context.textTheme.bodyLarge,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: .zero,
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding: .zero,
                            horizontalTitleGap: 8,
                            leading: AppIconButton(
                              icon: Iconsax.notification_copy,
                              backgroundColor:
                                  context.colors.tertiaryContainer,
                              borderRadius: .circular(32),
                            ),
                            title: Text(
                              'Congrats, Max has been adopted',
                            ),
                            subtitle: Text('Check it out'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 2,
                            thickness: 2,
                          );
                        },
                        itemCount: 2,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Yesterday',
                        style: context.textTheme.bodyLarge,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: .zero,
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding: .zero,
                            horizontalTitleGap: 8,
                            leading: AppIconButton(
                              icon: Iconsax.notification_copy,
                              backgroundColor:
                                  context.colors.tertiaryContainer,
                              borderRadius: .circular(32),
                            ),
                            title: Text(
                              'Congrats, Max has been adopted',
                            ),
                            subtitle: Text('Check it out'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 2,
                            thickness: 2,
                          );
                        },
                        itemCount: 3,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'April 12, 2026',
                        style: context.textTheme.bodyLarge,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: .zero,
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding: .zero,
                            horizontalTitleGap: 8,
                            leading: AppIconButton(
                              icon: Iconsax.notification_copy,
                              backgroundColor:
                                  context.colors.tertiaryContainer,
                              borderRadius: .circular(32),
                            ),
                            title: Text(
                              'Congrats, Max has been adopted',
                            ),
                            subtitle: Text('Check it out'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 2,
                            thickness: 2,
                          );
                        },
                        itemCount: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
