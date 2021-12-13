part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignOutResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Models.User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);
      return SignInSignOutResult(user: user);
    } catch (e) {
      return SignInSignOutResult(message: e.toString());
    }
  }

  static Future<SignInSignOutResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Models.User user = await result.user.fromFireStore();
      return SignInSignOutResult(user: user);
    } catch (e) {
      return SignInSignOutResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SignInSignOutResult {
  final Models.User user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}
