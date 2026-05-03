import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/chat/presentation/bloc/chat_room/chat_room_bloc.dart';

class AdopterInfoSection extends StatelessWidget {
  const AdopterInfoSection({required this.request, super.key});

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    return BlocListener<ChatRoomBloc, ChatRoomState>(
      listener: (context, state) async {
        await state.whenOrNull(
          roomReady: (room) => context.pushNamed(
            AppRoutes.chatDetail.name,
            pathParameters: {'id': room.id},
            extra: room,
          ),
          failure: (failure) {
            showSnackBar(context, content: failure.message);
          },
        );
      },
      child: Padding(
        padding: const .only(left: 16),
        child: Column(
          crossAxisAlignment: .end,
          spacing: 8,
          children: [
            Padding(
              padding: const .only(right: 16),
              child: Text(
                'Thông tin người nhận nuôi',
                style: context.textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: const .all(16),
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                border: const Border(
                  top: BorderSide(),
                  left: BorderSide(),
                  bottom: BorderSide(),
                ),
                borderRadius: const .only(
                  topLeft: .circular(32),
                  bottomLeft: .circular(32),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  spacing: 16,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.colors.primary,
                          width: 2,
                        ),
                        borderRadius: .circular(16),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            request.adopterAvatar,
                          ),
                          fit: .cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .stretch,
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              const Text('Tên:'),
                              Text(request.adopterName),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              const Text('Số điện thoại: '),
                              Text(request.adopterPhone),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: .end,
                            spacing: 16,
                            children: [
                              Expanded(
                                child: AppIconButton(
                                  onTap: () {},
                                  icon: Iconsax.call_copy,
                                ),
                              ),
                              Expanded(
                                child: AppIconButton(
                                  onTap: () {
                                    if (currentUser != null) {
                                      context
                                          .read<ChatRoomBloc>()
                                          .add(
                                            ChatRoomEvent.roomCreated(
                                              currentUser:
                                                  currentUser,
                                              otherUserId:
                                                  request.adopterId,
                                            ),
                                          );
                                    }
                                  },
                                  icon: Iconsax.messages_copy,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
