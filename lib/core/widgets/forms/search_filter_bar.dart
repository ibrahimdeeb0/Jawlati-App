import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class TextFieldSearchBar extends StatefulWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final String searchHint;

  const TextFieldSearchBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.searchHint,
  });

  @override
  State<TextFieldSearchBar> createState() => _TextFieldSearchBarState();
}

class _TextFieldSearchBarState extends State<TextFieldSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchQuery);
  }

  @override
  void didUpdateWidget(TextFieldSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _controller.text = widget.searchQuery;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderGray.colorWithOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onSearchChanged,
        textAlign: TextAlign.right,
        style: AppTextStyles.body16GrayMedium,
        decoration: InputDecoration(
          hintText: widget.searchHint,
          hintStyle: AppTextStyles.body16GrayMedium,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.gray,
            size: 24.r,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                    widget.onSearchChanged('');
                  },
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.gray,
                    size: 20.r,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: AppColors.mainBlue,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
