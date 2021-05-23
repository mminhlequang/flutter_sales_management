import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/constants/constants.dart';
import 'package:flutter_sales_management/app/utils/app_valid.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../ui.dart';

class AuthenticationScreen extends BaseScreen<AuthenticationController> {
  Widget _buildFormLogin() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: PhysicalModel(
        elevation: 16,
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppImages.imgStart,
                          width: Get.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: GetX<AuthenticationController>(
                            builder: (_) => Column(
                              children: controller.state.value ==
                                      AuthenticationState.SIGN_IN
                                  ? [
                                      WidgetInputUnderline(
                                        validator: AppValid.validatePhone(),
                                        controller: controller.phoneController,
                                        hint: 'Input your phone ...',
                                        style: STYLE_LARGE_BOLD.copyWith(
                                            color: PRIMARY_DARK_COLOR),
                                        hintStyle: STYLE_LARGE_BOLD.copyWith(
                                            color: PRIMARY_COLOR),
                                      ),
                                      const SizedBox(
                                        height: 45,
                                      ),
                                      WidgetRaisedGradientButton(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Text(
                                            'SignIn',
                                            style: STYLE_MEDIUM_BOLD.copyWith(
                                                color: Colors.white),
                                          ),
                                          onPressed: controller.signIn),
                                    ]
                                  : [
                                      SizedBox(
                                        width: Get.width / 2,
                                        child: PinInputTextField(
                                          pinLength: 6,
                                          decoration: UnderlineDecoration(
                                            colorBuilder: FixedColorBuilder(
                                                PRIMARY_COLOR),
                                            textStyle: STYLE_LARGE_BOLD
                                                .copyWith(color: PRIMARY_COLOR),
                                            gapSpace: 8,
                                          ),
                                          focusNode:
                                              controller.pinCodeFocusNode,
                                          controller: controller.codeController,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              controller.state.value =
                                                  AuthenticationState.SIGN_IN;
                                            },
                                            child: Text(
                                              'ReInput number phone!',
                                              style: STYLE_SMALL_BOLD.copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: PRIMARY_COLOR),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      WidgetRaisedGradientButton(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Text(
                                            'Verify',
                                            style: STYLE_MEDIUM_BOLD.copyWith(
                                                color: Colors.white),
                                          ),
                                          onPressed: controller.verify),
                                    ],
                            ),
                          )),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 5, child: Center(child: _buildFormLogin())),
          Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
      child: Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: Center(child: _buildFormLogin())),
          Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return _buildFormLogin();
  }
}
