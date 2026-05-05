import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/router/router.dart';

part 'nav_item.freezed.dart';

@freezed
abstract class NavItem with _$NavItem {
  const factory NavItem({
    required IconData icon,
    required String title,
    required String routeName,
  }) = _NavItem;
}

final List<NavItem> accountNavItems = [
  NavItem(
    icon: Iconsax.user_copy,
    title: 'Hồ sơ người dùng',
    routeName: AppRoutes.userProfile.name,
  ),
  NavItem(
    icon: Iconsax.key_copy,
    title: 'Đổi mật khẩu',
    routeName: AppRoutes.accountChangePassword.name,
  ),
];

const List<NavItem> appNavItems = [
  NavItem(
    icon: Iconsax.setting_2_copy,
    title: 'Hiển thị',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.notification_1_copy,
    title: 'Thông báo',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.warning_2_copy,
    title: 'Báo lỗi ứng dụng',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.info_circle_copy,
    title: 'Về ứng dụng',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.message_question_copy,
    title: 'Câu hỏi thường gặp',
    routeName: '',
  ),
];
