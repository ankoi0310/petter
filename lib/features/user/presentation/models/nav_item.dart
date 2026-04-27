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
    title: 'Account Information',
    routeName: AppRoutes.accountInfo.name,
  ),
  NavItem(
    icon: Iconsax.key_copy,
    title: 'Change Password',
    routeName: AppRoutes.accountInfo.name,
  ),
  NavItem(
    icon: Iconsax.mobile_copy,
    title: 'Devices',
    routeName: AppRoutes.accountChangePassword.name,
  ),
];

const List<NavItem> appNavItems = [
  NavItem(
    icon: Iconsax.setting_2_copy,
    title: 'Appearance',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.notification_1_copy,
    title: 'Notifications',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.warning_2_copy,
    title: 'Report issue',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.info_circle_copy,
    title: 'About',
    routeName: '',
  ),
  NavItem(
    icon: Iconsax.message_question_copy,
    title: 'FAQ',
    routeName: '',
  ),
];
