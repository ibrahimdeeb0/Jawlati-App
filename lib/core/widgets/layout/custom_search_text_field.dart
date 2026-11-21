import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextField extends StatelessWidget {
  final SearchFieldParameters parameters;

  const CustomSearchTextField({
    super.key,
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: parameters.padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        child: TextField(
          controller: parameters.controller,
          onChanged: parameters.onChanged,
          decoration: InputDecoration(
            hintText: parameters.hintText,
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: parameters.fillColor ?? Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(parameters.borderRadius ?? 12.r),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          ),
        ),
      ),
    );
  }
}

class SearchFieldParameters {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final double? borderRadius;
  SearchFieldParameters({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.padding,
    this.fillColor,
    this.borderRadius,
  });
}
