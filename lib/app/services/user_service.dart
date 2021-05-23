import 'package:flutter_sales_management/app/resources/repository/firebase_auth_repository.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  final FirebaseAuthRepository _authRepository = FirebaseAuthRepository();

  FirebaseAuthRepository get repo => _authRepository;

  bool get logged => _authRepository.user != null;

  @override
  void onInit() {
    super.onInit();
  }
}
