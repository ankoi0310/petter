import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/rejection_reason.dart';
import 'package:petter/core/enums/request_status.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';
import 'package:petter/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';

class AdoptionRequestDetailBottomBar extends StatelessWidget {
  const AdoptionRequestDetailBottomBar({
    required this.request,
    super.key,
  });

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    if (request.status == .rejected ||
        request.status == .approved ||
        request.status == .cancelled) {
      return Container(
        padding: const .all(12),
        decoration: BoxDecoration(
          color: switch (request.status) {
            .rejected => context.colors.errorContainer,
            .cancelled => context.colors.errorContainer,
            .approved => context.colors.primaryContainer,
            _ => context.colors.tertiaryContainer,
          },
          borderRadius: .circular(16),
          border: .all(),
        ),
        child: Row(
          mainAxisAlignment: .center,
          spacing: 8,
          children: [
            Icon(switch (request.status) {
              .rejected => Iconsax.close_circle_copy,
              .cancelled => Iconsax.close_circle_copy,
              .approved => Iconsax.tick_circle_copy,
              _ => Iconsax.info_circle_copy,
            }),
            Text(
              request.status.label,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    if (currentUser?.id == request.adopterId) {
      return Row(
        spacing: 16,
        children: [Expanded(child: _buildCancelButton(context))],
      );
    }

    if (request.status == .reviewing) {
      return Row(
        spacing: 16,
        children: [
          Expanded(child: _buildRejectButton(context)),
          Expanded(child: _buildApproveButton(context)),
        ],
      );
    }

    return Row(
      spacing: 16,
      children: [
        Expanded(child: _buildRejectButton(context)),
        Expanded(child: _buildReviewButton(context)),
        Expanded(child: _buildApproveButton(context)),
      ],
    );
  }

  AppTextButton _buildCancelButton(BuildContext context) {
    return AppTextButton(
      onTap: () async {
        context.read<AdoptionBloc>().add(
          AdoptionEvent.updateAdoptionRequest(
            UpdateAdoptionRequestParams(
              id: request.id,
              status: .cancelled,
            ),
          ),
        );

        context.read<NotificationBloc>().add(
          .createNotification(
            CreateNotificationParams(
              receiverId: request.petOwnerId,
              title: 'Yêu cầu đã bị hủy',
              body:
                  '${request.adopterName} đã rút lại yêu cầu nhận nuôi bé ${request.petName}.',
              type: .adoptionRequest,
            ),
          ),
        );
      },
      text: 'Từ chối',
      padding: const .all(12),
      borderRadius: .circular(16),
      border: Border.all(),
      backgroundColor: context.colors.errorContainer,
      textStyle: context.textTheme.bodyLarge!.copyWith(
        color: context.colors.onErrorContainer,
      ),
      boxShadow: [
        BoxShadow(
          color: context.colors.onErrorContainer,
          blurRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  AppTextButton _buildRejectButton(BuildContext context) {
    return AppTextButton(
      onTap: () async {
        final rejectionReason = await _buildShowRejectDialog(context);

        if (rejectionReason != null) {
          context.read<AdoptionBloc>().add(
            AdoptionEvent.updateAdoptionRequest(
              UpdateAdoptionRequestParams(
                id: request.id,
                status: RequestStatus.rejected,
                rejectionReason: rejectionReason,
              ),
            ),
          );

          context.read<NotificationBloc>().add(
            .createNotification(
              CreateNotificationParams(
                receiverId: request.adopterId,
                title: 'Cập nhật về yêu cầu nhận nuôi',
                body:
                    'Yêu cầu nhận nuôi bé ${request.petName} không thành công. '
                    'Lý do: ${rejectionReason}.',
                type: .adoptionRequest,
              ),
            ),
          );
        }
      },
      text: 'Từ chối',
      padding: const .all(12),
      borderRadius: .circular(16),
      border: Border.all(),
      backgroundColor: context.colors.errorContainer,
      textStyle: context.textTheme.bodyLarge!.copyWith(
        color: context.colors.onErrorContainer,
      ),
      boxShadow: [
        BoxShadow(
          color: context.colors.onErrorContainer,
          blurRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  AppTextButton _buildReviewButton(BuildContext context) {
    return AppTextButton(
      onTap: () {
        context.read<AdoptionBloc>().add(
          AdoptionEvent.updateAdoptionRequest(
            UpdateAdoptionRequestParams(
              id: request.id,
              status: RequestStatus.reviewing,
            ),
          ),
        );

        context.read<NotificationBloc>().add(
          .createNotification(
            CreateNotificationParams(
              receiverId: request.adopterId,
              title: 'Yêu cầu đang được xem xét',
              body:
                  'Chủ nuôi đang xem xét hồ sơ của bạn cho bé ${request.petName}. '
                  'Bạn sẽ sớm nhận được phản hồi.',
              type: .adoptionRequest,
            ),
          ),
        );
      },
      text: 'Xem xét',
      padding: const .all(12),
      borderRadius: .circular(16),
      border: Border.all(),
      backgroundColor: context.colors.tertiaryContainer,
      textStyle: context.textTheme.bodyLarge!.copyWith(
        color: context.colors.onTertiaryContainer,
      ),
      boxShadow: [
        BoxShadow(
          color: context.colors.onTertiaryContainer,
          blurRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  AppTextButton _buildApproveButton(BuildContext context) {
    return AppTextButton(
      onTap: () {
        context.read<AdoptionBloc>().add(
          .updateAdoptionRequest(
            UpdateAdoptionRequestParams(
              id: request.id,
              status: RequestStatus.approved,
            ),
          ),
        );

        context.read<PetBloc>().add(
          .updatePet(
            UpdatePetParams(id: request.petId, isAdopted: true),
          ),
        );

        context.read<NotificationBloc>().add(
          .createNotification(
            CreateNotificationParams(
              receiverId: request.adopterId,
              title: 'Xin chúc mừng! 🎉',
              body:
                  'Yêu cầu nhận nuôi bé ${request.petName} của bạn đã được chấp '
                  'thuận. Hãy trao đổi thêm để gặp mặt và đón em về nhà mới nhé!',
              type: .adoptionRequest,
            ),
          ),
        );
      },
      text: 'Đồng ý',
      padding: const .all(12),
      borderRadius: .circular(16),
      border: Border.all(),
      backgroundColor: context.colors.primaryContainer,
      textStyle: context.textTheme.bodyLarge!.copyWith(
        color: context.colors.onPrimaryContainer,
      ),
      boxShadow: [
        BoxShadow(
          color: context.colors.onPrimaryContainer,
          blurRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Future<String?> _buildShowRejectDialog(BuildContext context) {
    const reasons = RejectionReason.values;
    final messageController = TextEditingController(
      text: reasons.first.label,
    );
    var selectedReason = reasons.first;

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text(
              'Chọn lý do từ chối',
              style: context.textTheme.titleLarge,
            ),
            contentPadding: const .symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            insetPadding: const .symmetric(horizontal: 16),
            content: SizedBox(
              width: context.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Danh sách Radio Buttons
                  RadioGroup<RejectionReason>(
                    groupValue: selectedReason,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedReason = value;

                          if (value != RejectionReason.other) {
                            messageController.text = value.label;
                          } else {
                            messageController.clear();
                          }
                        });
                      }
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reasons.length,
                      itemBuilder: (context, index) {
                        final reason = reasons[index];
                        return RadioListTile<RejectionReason>(
                          minVerticalPadding: 8,
                          minTileHeight: 0,
                          horizontalTitleGap: 8,
                          title: Text(
                            reason.label,
                            style: context.textTheme.titleMedium,
                          ),
                          value: reason,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                    ),
                  ),

                  // Hiển thị ô nhập text nếu chọn "Lý do khác"
                  if (selectedReason == RejectionReason.other)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: AppTextFormField(
                        controller: messageController,
                        focusNode: FocusNode(),
                        title: 'Nhập lý do cụ thể',
                        maxLines: 3,
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              AppTextButton.outline(
                context,
                onTap: context.pop,
                text: 'Huỷ',
              ),
              AppTextButton(
                onTap: () {
                  context.pop(messageController.text.trim());
                },
                text: 'Xác nhận',
              ),
            ],
          ),
        );
      },
    );
  }
}
