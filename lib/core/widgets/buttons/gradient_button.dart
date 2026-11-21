import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';

import '../../theme/app_colors.dart';

class GradientButton extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final VoidCallback? onPressedSync;
  final String text;
  final double? width;
  final double? height;
  final bool enabled;
  final IconData? icon;
  final bool showLoadingOnPress;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const GradientButton({
    super.key,
    this.onPressed,
    this.onPressedSync,
    required this.text,
    this.width,
    this.height,
    this.enabled = true,
    this.icon,
    this.showLoadingOnPress = true,
    this.padding,
    this.borderRadius,
  }) : assert(
          onPressed != null || onPressedSync != null,
          'Either onPressed or onPressedSync must be provided',
        );

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.enabled ||
        (widget.onPressed == null && widget.onPressedSync == null) ||
        _isLoading;

    return Container(
      width: widget.width,
      height: widget.height ?? 50.h,
      decoration: BoxDecoration(
        gradient: isDisabled
            ? LinearGradient(
                colors: [
                  AppColors.gray.colorWithOpacity(0.5),
                  AppColors.gray.colorWithOpacity(0.3),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )
            : const LinearGradient(
                colors: [AppColors.darkBlue, AppColors.mainBlue],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.r),
        boxShadow: isDisabled
            ? null
            : [
                BoxShadow(
                  color: AppColors.mainBlue.colorWithOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : _handlePress,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.r),
          child: Container(
            padding: widget.padding ??
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isLoading) ...[
                  SizedBox(
                    width: 16.w,
                    height: 16.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white.colorWithOpacity(0.8),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ] else if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 18.r,
                  ),
                  SizedBox(width: 8.w),
                ],
                Text(
                  _isLoading ? 'جارٍ الحفظ...' : widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handlePress() async {
    if (_isLoading) return;

    try {
      if (widget.showLoadingOnPress && widget.onPressed != null) {
        setState(() {
          _isLoading = true;
        });
      }

      if (widget.onPressed != null) {
        await widget.onPressed!();
      } else if (widget.onPressedSync != null) {
        widget.onPressedSync!();
      }
    } catch (e) {
      // Handle error if needed
      debugPrint('GradientButton error: $e');
    } finally {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

// Legacy support - for backward compatibility
class LegacyGradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  const LegacyGradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      onPressedSync: onPressed,
      text: text,
      width: width,
      showLoadingOnPress: false,
    );
  }
}

/*

 / للـ sync functions
GradientButton(
  onPressedSync: () => print('Hello'),
  text: 'Click me',
)

  للـ async functions (مثل حالتك)
GradientButton(
  onPressed: () async => await saveData(),
  text: 'Save',
  showLoadingOnPress: true,
)

*/
