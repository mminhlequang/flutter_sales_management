import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  FirebaseAuthRepository._();

  static FirebaseAuthRepository? _instance;

  factory FirebaseAuthRepository() {
    if (_instance == null) _instance = FirebaseAuthRepository._();
    return _instance!;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future verifyPhoneNumber(String phoneNumber,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 120),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }


  Future<ConfirmationResult> verifyPhoneNumberWebPlatform(String phoneNumber) async {
    return  await _auth.signInWithPhoneNumber(phoneNumber);
  }

  Future verifyEmail(String email) async {
    await _auth.sendSignInLinkToEmail(email: email,
        actionCodeSettings: ActionCodeSettings(url: 'https://localhost', handleCodeInApp: true));
  }

  Future<UserCredential> signInWithCredential(AuthCredential authCredential) =>
      _auth.signInWithCredential(authCredential);

  void listenAuthStateChanged(Function(User? user) _) {
    FirebaseAuth.instance.authStateChanges().listen(_);
  }

  Future persistence() async {
    // Disable persistence on web platforms
    await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  }

  Future<void> signOut() => _auth.signOut();
}
