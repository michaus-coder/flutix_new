part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      model.User user = model.User(result.user!.uid, result.user!.email!,
          balance: 5000,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
      await UserServices.updateUser(user);
      return SignInSignUpResult(user: user, message: "Sign Up Success");
    } catch (e) {
      return SignInSignUpResult(
          user: model.User('', '',
              name: '',
              selectedGenres: const [],
              selectedLanguage: '',
              balance: 0),
          message: e.toString().split(",")[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      model.User user = await UserServices.getUser(result.user!.uid);
      return SignInSignUpResult(user: user, message: '');
    } catch (e) {
      return SignInSignUpResult(
          message: e.toString().split(",")[1].trim(),
          user: model.User('', '',
              name: '',
              selectedGenres: const [],
              selectedLanguage: '',
              balance: 0));
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  model.User user;
  final String message;
  SignInSignUpResult({required this.user, required this.message});
}
