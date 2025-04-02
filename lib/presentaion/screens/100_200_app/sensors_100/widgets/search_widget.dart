import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/default_text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: DefaultTextFormField(
              hintText: AppStrings.search,
              hintStyle: Styles.hintText(context),
              fillColor: AppColors.black,
              borderSideEnabledColor: const Color(0xffF1F5F9),
              hasBorder: true,
              borderSideColor: const Color(0xffF1F5F9),
              contentPaddingVertical: AppConstants.height20(context),
              prefixIcon: SvgPicture.asset(
                AppAssets.search,
                fit: BoxFit.scaleDown,
              ),
              onChange: onChanged,
              textInputType: TextInputType.text,
            ),
          ),
          SizedBox(width: AppConstants.width15(context)),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AppConstants.height15(context)),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF1F5F9)),
                borderRadius:
                    BorderRadius.circular(AppConstants.height10(context)),
              ),
              child: Image.asset(
                AppAssets.filter,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.height * .1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
