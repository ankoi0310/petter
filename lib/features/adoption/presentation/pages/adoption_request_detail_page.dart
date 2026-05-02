import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/request_status.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';

class AdoptionRequestDetailPage extends StatelessWidget {
  const AdoptionRequestDetailPage({required this.request, super.key});

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdoptionBloc, AdoptionState>(
      listener: (context, state) {
        state.maybeWhen(
          updateRequestSuccess: () {
            showSnackBar(
              context,
              content: 'Cập nhật yêu cầu thành công',
            );
          },
          error: (message) {
            showSnackBar(context, content: message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Adoption Request Detail'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const .symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  Padding(
                    padding: const .only(right: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 8,
                      children: [
                        Padding(
                          padding: const .symmetric(horizontal: 16),
                          child: Text(
                            'Thông tin thú cưng',
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          padding: const .all(16),
                          margin: const .only(right: 16),
                          decoration: BoxDecoration(
                            color: context.colors.primaryContainer,
                            border: const Border(
                              top: BorderSide(),
                              right: BorderSide(),
                              bottom: BorderSide(),
                            ),
                            borderRadius: const .only(
                              topRight: .circular(32),
                              bottomRight: .circular(32),
                            ),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              spacing: 16,
                              mainAxisSize: .min,
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
                                      image:
                                          CachedNetworkImageProvider(
                                            request.petImageUrl,
                                          ),
                                      fit: .cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .end,
                    spacing: 8,
                    children: [
                      Padding(
                        padding: const .symmetric(horizontal: 16),
                        child: Text(
                          'Thông tin người nhận nuôi',
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        padding: const .all(16),
                        margin: const .only(left: 16),
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
                                      mainAxisAlignment:
                                          .spaceBetween,
                                      children: [
                                        const Text('Tên:'),
                                        Text(request.adopterName),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          .spaceBetween,
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
                                            onTap: () {},
                                            icon:
                                                Iconsax.messages_copy,
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
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const .symmetric(horizontal: 16, vertical: 12),
              child: Row(
                spacing: 16,
                mainAxisSize: .min,
                children: [
                  Expanded(
                    child: AppTextButton(
                      onTap: () async {
                        final rejectionReason =
                            await buildShowRejectDialog(context);

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
                        }
                      },
                      text: 'Từ chối',
                      padding: const .all(12),
                      borderRadius: .circular(16),
                      border: Border.all(),
                      backgroundColor: context.colors.errorContainer,
                      textStyle: context.textTheme.bodyLarge!
                          .copyWith(
                            color: context.colors.onErrorContainer,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.onErrorContainer,
                          blurRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppTextButton(
                      onTap: () {},
                      text: 'Xem xét',
                      padding: const .all(12),
                      borderRadius: .circular(16),
                      border: Border.all(),
                      backgroundColor:
                          context.colors.tertiaryContainer,
                      textStyle: context.textTheme.bodyLarge!
                          .copyWith(
                            color: context.colors.onTertiaryContainer,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.onTertiaryContainer,
                          blurRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppTextButton(
                      onTap: () {},
                      text: 'Đồng ý',
                      padding: const .all(12),
                      borderRadius: .circular(16),
                      border: Border.all(),
                      backgroundColor:
                          context.colors.primaryContainer,
                      textStyle: context.textTheme.bodyLarge!
                          .copyWith(
                            color: context.colors.onPrimaryContainer,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.onPrimaryContainer,
                          blurRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String?> buildShowRejectDialog(BuildContext context) {
    final messageController = TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận từ chối'),
          content: Column(
            mainAxisSize: .min,
            children: [
              AppTextFormField(
                controller: messageController,
                focusNode: FocusNode(),
                title: 'Lý do từ chối',
                maxLines: 4,
              ),
            ],
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
        );
      },
    );
  }
}
