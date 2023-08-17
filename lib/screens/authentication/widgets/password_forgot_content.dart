import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_gradient_text.dart';
import '../../../core/widgets/custom_textfield.dart';

class PasswordForgotContent extends StatelessWidget {
  const PasswordForgotContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              child: Text(
                '',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.colorPrimary,
                    ),
              ),
            ),
          ),
          const Spacer(),
          GradientText(
            'Mot de passe oublié',
            gradient: const LinearGradient(
                colors: [AppColors.colorPrimary2, AppColors.colorPrimary]),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.colorPrimary),
          ),
          // SizedBox(height: 35.h),
          const Spacer(flex: 3),
          const CustomTextField(
              label: 'Nom d\'utilisateur', icon: Icons.person_outline),
          const Spacer(flex: 3),
          CustomButton(
            label: 'Restaurer',
            backgroundColor: AppColors.colorPrimary,
            labelColor: Colors.white,
            onTap: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
