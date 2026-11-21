import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:jawlati/core/theme/app_text_styles.dart';

class ImagePickerCard extends StatefulWidget {
  final String title;
  final String? imagePath;
  final Function(String?) onImageSelected;

  const ImagePickerCard({
    super.key,
    required this.title,
    required this.onImageSelected,
    this.imagePath,
  });

  @override
  State<ImagePickerCard> createState() => _ImagePickerCardState();
}

class _ImagePickerCardState extends State<ImagePickerCard> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 80,
      );

      if (image != null) {
        widget.onImageSelected(image.path);
      }
    } catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في اختيار الصورة: ${e.toString()}')),
        );
      }
    }
  }

  void _removeImage() {
    widget.onImageSelected(null);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.body14BlackMedium,
            ),
            12.verticalSpace,
            if (widget.imagePath != null) ...[
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: FileImage(File(widget.imagePath!)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: _pickImage,
                      icon: Icon(Icons.edit, size: 16.sp),
                      label: Text('تغيير', style: AppTextStyles.caption12BlueRegular),
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: _removeImage,
                      icon: Icon(Icons.delete, size: 16.sp, color: Colors.red),
                      label: Text('حذف', 
                        style: AppTextStyles.caption12BlueRegular.copyWith(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ] else ...[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    color: Colors.grey.shade50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 32.sp,
                        color: Colors.grey.shade600,
                      ),
                      8.verticalSpace,
                      Text(
                        'اضغط لإضافة صورة',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}