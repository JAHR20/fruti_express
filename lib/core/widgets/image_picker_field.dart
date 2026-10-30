import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerField extends StatelessWidget {
  final File? selectedImage;
  final String? existingImageUrl;
  final VoidCallback? onTap;
  final double height;
  final String placeholderText;

  const ImagePickerField({
    super.key,
    required this.selectedImage,
    this.existingImageUrl,
    required this.onTap,
    this.height = 140,
    this.placeholderText = 'Seleccionar imagen',
  });

  @override
  Widget build(BuildContext context) {
    final hasLocal = selectedImage != null;
    final hasSaved = existingImageUrl != null && existingImageUrl!.isNotEmpty;
    final hasImage = hasLocal || hasSaved;

    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerHighest, 
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: colors.outlineVariant), 
            borderRadius: BorderRadius.circular(12),
            image: hasImage
                ? DecorationImage(
                    image: hasLocal
                        ? FileImage(selectedImage!) as ImageProvider
                        : NetworkImage(existingImageUrl!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      colors.scrim.withValues(alpha: 0.15), 
                      BlendMode.darken,
                    ),
                  )
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (!hasImage)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 40, color: colors.primary),
                    const SizedBox(height: 8),
                    Text(
                      placeholderText,
                      style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              if (hasImage)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: colors.surface,
                    child: Icon(Icons.edit, size: 18, color: colors.primary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}