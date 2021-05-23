import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/resources/repository/firebase_auth_repository.dart';
import 'package:flutter_sales_management/app/routes/app_pages.dart';
import 'package:flutter_sales_management/app/services/services.dart';
import 'package:get/get.dart';

import '../ui.dart';

enum AuthenticationState { SIGN_IN, VERIFY }

class AuthenticationController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final FirebaseAuthRepository repo = Get.find<UserService>().repo;
  final FocusNode pinCodeFocusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final obscureText = true.obs;
  final state = AuthenticationState.SIGN_IN.obs;

  String get phone => phoneController.text;

  String get code => codeController.text;

  ConfirmationResult? _confirmationResult;

  String get _realPhone {
    String _phone = phone;
    if (_phone.startsWith('0'))
      _phone = '+84${_phone.substring(1)}';
    else
      _phone = '+84$_phone';
    return _phone;
  }

  @override
  void onInit() {
    super.onInit();
  }

  signIn() async {
    if (formKey.currentState?.validate() ?? false) {
      easyLoading(true);
      if (kIsWeb) {
        _confirmationResult =
            await repo.verifyPhoneNumberWebPlatform(_realPhone);
        if (_confirmationResult != null)
          state.value = AuthenticationState.VERIFY;
      } else {
        repo.verifyPhoneNumber(_realPhone, verificationCompleted,
            verificationFailed, codeSent, codeAutoRetrievalTimeout);
      }
      easyLoading(false);
    }
  }

  void verify() async {
    if (formKey.currentState?.validate() ?? false) {
      if (kIsWeb) {
        UserCredential? credential = await _confirmationResult?.confirm(code);
        if (credential != null) {
          await repo.signInWithCredential(credential.credential!);
          Get.offNamed(Routes.DASHBOARD);
        }
      } else {}
    }
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {}

  void verificationFailed(FirebaseAuthException error) {}

  void codeSent(String verificationId, int? forceResendingToken) {}

  void codeAutoRetrievalTimeout(String verificationId) {}

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }
}
