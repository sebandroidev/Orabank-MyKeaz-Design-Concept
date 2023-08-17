import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.icon,
      required this.label,
      this.validator,
      this.inputType});

  final IconData? icon;
  final String label;
  final String Function(String?)? validator;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            icon != null ? EdgeInsets.symmetric(vertical: 18.h) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.normal,
            ),
        prefixIcon: icon != null
            ? IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 14.w),
                    Icon(
                      icon,
                      size: 22.sp,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: VerticalDivider(width: 25.w),
                    ),
                  ],
                ),
              )
            : null,
        label: Text(label),
        hintText: label,
      ),
    );
  }
}
