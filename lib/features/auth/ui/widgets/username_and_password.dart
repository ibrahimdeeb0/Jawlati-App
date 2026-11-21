import 'package:flutter/material.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/widgets/forms/app_text_form_field.dart';

class UserNameAndPassword extends StatefulWidget {
  const UserNameAndPassword({
    super.key,
  });

  @override
  State<UserNameAndPassword> createState() => _UserNameAndPasswordState();
}

class _UserNameAndPasswordState extends State<UserNameAndPassword> {
  bool _isObscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: 'اسم المستخدم',
          validator: (value) {},
        ),
        14.spacingVertical,
        AppTextFormField(
          labelText: 'كلمة المرور',
          validator: (value) {},
          isObscureText: _isObscureText,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.brandGray,
              size: 24,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      ],
    );
  }
}
