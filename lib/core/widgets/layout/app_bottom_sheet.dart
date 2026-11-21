import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';

import 'custom_search_text_field.dart';

class AppBottomSheet {
  /// Standard Bottom Sheet (Fixed at the bottom)
  static void showStandard({
    required BuildContext context,
    required Widget content,
    Color? backgroundColor,
    double elevation = 8.0,
  }) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.r)),
            boxShadow: elevation > 0
                ? [BoxShadow(color: Colors.black12, blurRadius: elevation)]
                : [],
          ),
          child: content,
        );
      },
    );
  }

  /// Modal Bottom Sheet (Covers the screen partially or fully)
  static Future<void> showModal({
    required BuildContext context,
    required Widget content,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    EdgeInsets? padding,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: padding ?? MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      if (title != null) ...[
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Divider(height: 1.h),
                        8.spacingVertical,
                      ],
                      Spacer(),
                      OutlinedButton(
                        child: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                content,
              ],
            ),
          ),
        );
      },
    );
  }

  /// Draggable Bottom Sheet (User can drag up/down)
  static void showDraggable({
    required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    double initialChildSize = 0.3,
    double minChildSize = 0.2,
    double maxChildSize = 0.8,
    Color? backgroundColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.r)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0.r),
                ),
              ),
              child: builder(context, scrollController),
            );
          },
        );
      },
    );
  }

  /// Custom Modal Bottom Sheet with Search Field
  static Future<void> showCustomModal({
    required BuildContext context,
    required Widget content,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    required final SearchFieldParameters searchFieldParameters,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Colors.white,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar for dragging indication
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      if (title != null) ...[
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Divider(height: 1.h),
                        8.spacingVertical,
                      ],
                      Spacer(),
                      OutlinedButton(
                        child: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),

                CustomSearchTextField(parameters: searchFieldParameters),

                // Content wrapped in Expanded to allow scrolling
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 40.h),
                    // height: context.screenFlexHeight() * 0.372,
                    color: Colors.grey[50],
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          8.spacingVertical,
                          content,
                          8.spacingVertical,
                        ],
                      ),
                    ),
                  ),
                ),

                12.spacingVertical,
              ],
            ),
          ),
        );
      },
    );
  }
}
