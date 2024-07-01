import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

import '../values/export.dart';

class CountryTextFormField extends StatelessWidget {
  const CountryTextFormField({
    super.key,
    required this.mobileController,
  });

  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mobile No.",
          style: textSemiBold.copyWith(
              fontFamily: 'fraunces',
              fontSize: 12.sp,
              color: AppColor.black.withOpacity(0.3)),
        ),
        10.verticalSpace,
        // IntlPhoneField(
        //   autovalidateMode: AutovalidateMode.onUserInteraction,
        //   style: textSemiBold.copyWith(
        //       fontFamily: 'fraunces',
        //       fontSize: 16.sp,
        //       color: AppColor.black),
        //       dropdownTextStyle:textSemiBold.copyWith(
        //       fontFamily: 'fraunces',
        //       fontSize: 16.sp,
        //       color: AppColor.black.withOpacity(0.3)) ,
        //   autofocus: false,
        //   disableLengthCheck: true,
        //   controller: mobileController,
        //   dropdownIcon: Icon(
        //     Icons.straight_outlined,
        //     color: AppColor.black,
        //   ),
        //   showCountryFlag: false,
        //   disableAutoFillHints: true,
        //   showDropdownIcon: true,
        //   dropdownIconPosition: IconPosition.trailing,
        //   keyboardType: TextInputType.phone,
        //   decoration: InputDecoration(
        //     alignLabelWithHint: true,
        //     hintText: '00000 00000',
        //     hintStyle: textSemiBold.copyWith(
        //         fontFamily: 'fraunces',
        //         fontSize: 16.sp,
        //         color: AppColor.black.withOpacity(0.3)),
        //     filled: true,
        //     fillColor: AppColor.tetxFieldBg,
        //     prefixIcon: Icon(Icons.phone),
        //     border: OutlineInputBorder(
        //         borderSide: BorderSide.none,
        //         borderRadius: BorderRadius.circular(15.r)),
        //   ),
        //   initialCountryCode: 'IN',
        //   onChanged: (phone) {
        //     if (phone.number.length == 10) {
        //       print(phone.countryCode.replaceFirst('+', ''));
        //       authStore.countryCode = phone.countryCode.replaceFirst('+', '');
        //       authStore.mobileNumer = phone.number;
        //       authStore.changeColor();
        //     }
        //     else{
        //       authStore.resetColor();
        //     }
        //   },
        //   validator: (value){
        //     if(value!.completeNumber.toString().length == 0){
        //       return "Please enter mobile number";
        //     }else if(value.completeNumber.toString().length< 13){
        //       return "Please enter valid mobile number";
        //   }
        //   return null;})
        Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.tetxFieldBg,
              borderRadius: BorderRadius.circular(15.r)),
          child: Row(
            children: [
              Text(
                '+91',
                style: textSemiBold.copyWith(
                    fontSize: 16.sp, color: AppColor.black),
              ),
              Text(
                ' | ',
                style: textSemiBold.copyWith(
                    fontSize: 16.sp, color: AppColor.black),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  cursorColor: AppColor.transparent,
                  controller: mobileController,
                  style: textSemiBold.copyWith(
                      fontSize: 16.sp, color: AppColor.black),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.digitsOnly,
                    PhoneNumberFormatter()
                  ],
                  onChanged: (value) {
                    if (mobileController.text.replaceAll(' ', '').length == 10) {
                      authStore.mobileNumer = mobileController.text.replaceAll(' ', '');
                      authStore.changeColor();
                    } else {
                      authStore.resetColor();
                    }
                  },
                  decoration: InputDecoration(
                      hintText: '00000 00000',
                      hintStyle: textSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: AppColor.black.withOpacity(0.3)),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )
            ],
          ).wrapPaddingHorizontal(15.r),
        )
      ],
    );
  }
}


class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText =
        newValue.text.replaceAll(' ', ''); 
    if (newText.length > 5) {
      newText = newText.substring(0, 5) + ' ' + newText.substring(5);
    }
    return TextEditingValue(
      text: newText,
      selection: newValue.selection.copyWith(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
    );
  }
}
