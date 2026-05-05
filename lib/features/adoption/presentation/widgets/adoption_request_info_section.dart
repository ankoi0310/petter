import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/date_time_extension.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';

class AdoptionRequestInfoSection extends StatelessWidget {
  const AdoptionRequestInfoSection({
    required this.request,
    super.key,
  });

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide()),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Ngày tạo yêu cầu',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: .bold,
                ),
              ),
              Text(request.createdAt.fullTimeDate),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Lần cập nhật cuối',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: .bold,
                ),
              ),
              Text(request.updatedAt.fullTimeDate),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Trạng thái',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: .bold,
                ),
              ),
              Text(request.status.label),
            ],
          ),
          if (request.rejectionReason != null &&
              request.rejectionReason!.isNotEmpty)
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Lý do từ chối',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: .bold,
                  ),
                ),
                Text(request.rejectionReason!),
              ],
            ),
        ],
      ),
    );
  }
}
