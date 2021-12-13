part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Models.User convertToUser(
          {String name = 'No Name',
          List<String> selectedGenres = const [],
          String selectedLanguage = 'English',
          int balance = 500000}) =>
      Models.User(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: balance);

  Future<Models.User> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}
