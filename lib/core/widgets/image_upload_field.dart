import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/image_util.dart';
import 'package:petter/core/widgets/button.dart';

class ImageUploadField extends StatefulWidget {
  const ImageUploadField({
    required this.onImageSelected,
    required this.onImageError,
    this.selectedImage,
    this.imageError,
    super.key,
  });

  final File? selectedImage;
  final String? imageError;
  final void Function(File?) onImageSelected;
  final void Function(String?) onImageError;

  @override
  State<ImageUploadField> createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: .gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final isValid = isImageFile(pickedFile.path);

      if (!isValid) {
        widget.onImageError('Định dạng không hợp lệ');
      }

      final selectedImage = File(pickedFile.path);

      widget.onImageSelected(selectedImage);
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (widget.imageError != null) {
      final result = Text(
        widget.imageError!,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.error,
        ),
      );
      return result;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text('Ảnh', style: context.textTheme.titleMedium),
            Text(
              '*',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.error,
              ),
            ),
          ],
        ),
        ListTile(
          onTap: pickImage,
          tileColor: context.colors.primaryContainer,
          shape: RoundedRectangleBorder(
            side: const BorderSide(),
            borderRadius: .circular(16),
          ),
          leading: AppIconButton(
            icon: Iconsax.gallery_copy,
            backgroundColor: context.colors.tertiaryContainer,
            borderRadius: .circular(32),
          ),
          title: Text(
            'Chọn ảnh thú cưng',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
          subtitle: Text(
            'Vui lòng đăng ảnh rõ nét',
            style: context.textTheme.bodySmall,
          ),
        ),
        ?_getRetrieveErrorWidget(),
      ],
    );
  }
}
