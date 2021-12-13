part of 'models.dart';

class User extends Equatable {
  final String id, email, name, selectedLanguage, profilePicture;
  final List<String> selectedGenres;
  final int balance;

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  User(
    this.id,
    this.email, {
    this.name,
    this.selectedLanguage,
    this.profilePicture,
    this.selectedGenres,
    this.balance,
  });

  @override
  List<Object> get props => [
        id,
        email,
        name,
        selectedLanguage,
        profilePicture,
        selectedGenres,
        balance
      ];
}
