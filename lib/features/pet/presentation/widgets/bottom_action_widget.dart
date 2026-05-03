import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/chat/presentation/bloc/chat_room/chat_room_bloc.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

class BottomActionWidget extends StatelessWidget {
  const BottomActionWidget({required this.pet, super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<ChatRoomBloc, ChatRoomState>(
          listener: (context, state) async {
            await state.whenOrNull(
              // Khi room sẵn sàng → navigate
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
        ),
        BlocListener<AdoptionBloc, AdoptionState>(
          listener: (context, state) {
            state.maybeWhen(
              createRequestSuccess: () {
                showSnackBar(
                  context,
                  content: 'Tạo yêu cầu thành công',
                );
              },
              error: (message) =>
                  showSnackBar(context, content: message),
              orElse: () {},
            );
          },
        ),
      ],
      child: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        child: Row(
          spacing: 16,
          children: currentUser != null && currentUser.id != pet.uid
              ? [
                  AppIconButton(
                    icon: Iconsax.call_copy,
                    padding: const .all(12),
                    borderRadius: .circular(16),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: context.colors.onPrimaryContainer,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  AppIconButton(
                    onTap: () {
                      context.read<ChatRoomBloc>().add(
                        ChatRoomEvent.roomCreated(
                          currentUser: currentUser,
                          otherUserId: pet.uid,
                        ),
                      );
                    },
                    icon: Iconsax.messages_2_copy,
                    padding: const .all(12),
                    borderRadius: .circular(16),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: context.colors.onPrimaryContainer,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  Expanded(
                    child: AppIconButton(
                      onTap: () {
                        context.read<AdoptionBloc>().add(
                          AdoptionEvent.createAdoptionRequest(
                            CreateAdoptionRequestParams(
                              pet: pet,
                              adopter: currentUser,
                            ),
                          ),
                        );
                      },
                      icon: Iconsax.pet_copy,
                      padding: const .all(12),
                      borderRadius: .circular(16),
                      border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.onPrimaryContainer,
                          blurRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
