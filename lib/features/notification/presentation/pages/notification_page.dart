import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/notification/presentation/bloc/notification_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông báo'), titleSpacing: 0),
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: .anywhere,
          onRefresh: () async {
            context.read<NotificationBloc>().add(
              const .getNotifications(),
            );
          },
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (notifications) {
                  if (notifications.isEmpty) {
                    return const Center(
                      child: Text('Bạn không có thông báo nào'),
                    );
                  }

                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const .symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      spacing: 8,
                      children: [
                        Padding(
                          padding: const .only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              context.read<NotificationBloc>().add(
                                const .readAllNotifications(),
                              );
                            },
                            child: Text(
                              'Đánh dấu đã xem tất cả',
                              textAlign: .end,
                              style: context.textTheme.labelMedium,
                            ),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),
                          padding: .zero,
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final notification = notifications[index];
                            return ListTile(
                              splashColor: Colors.transparent,
                              contentPadding: const .symmetric(
                                horizontal: 16,
                              ),
                              tileColor: notification.isRead
                                  ? null
                                  : context.colors.primaryContainer,
                              horizontalTitleGap: 8,
                              minVerticalPadding: 8,
                              leading: AppIconButton(
                                icon: switch (notification.type) {
                                  .adoptionRequest =>
                                    Iconsax.pet_copy,
                                  .system =>
                                    Iconsax.notification_copy,
                                },
                                backgroundColor:
                                    context.colors.tertiaryContainer,
                                borderRadius: .circular(32),
                              ),
                              title: Text(
                                notification.title,
                                style: context.textTheme.titleSmall,
                              ),
                              subtitle: Text(
                                notification.body,
                                maxLines: 2,
                                overflow: .ellipsis,
                                style: context.textTheme.bodySmall,
                              ),
                              onTap: () {
                                if (notification.isRead) return;

                                context.read<NotificationBloc>().add(
                                  .readNotification(notification.id),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 2,
                              thickness: 2,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
