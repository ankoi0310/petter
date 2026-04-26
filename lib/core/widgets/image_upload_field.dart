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
    this.selectedImage,
    super.key,
  });

  final File? selectedImage;
  final void Function(File?) onImageSelected;

  @override
  State<ImageUploadField> createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: .gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final isValid = isImageFile(pickedFile.path);

      if (!isValid) {
        setState(() {
          _retrieveDataError = "Incorrect image's format";
        });
      }

      final selectedImage = File(pickedFile.path);

      widget.onImageSelected(selectedImage);
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final result = Text(_retrieveDataError!);
      _retrieveDataError = null;
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
            Text('Image', style: context.textTheme.bodyLarge),
            Text(
              '*',
              style: context.textTheme.bodyLarge?.copyWith(
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
            'Choose image to upload',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
          subtitle: Text(
            'Make sure they look beauty',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colors.onPrimaryContainer,
            ),
          ),
        ),
        ?_getRetrieveErrorWidget(),
      ],
    );
  }
}
