part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(Models.User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? '',
    });
  }

  static Future<Models.User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return Models.User(id, snapshot.get('email'),
        name: snapshot.get('name'),
        balance: snapshot.get('balance'),
        selectedGenres: (snapshot.get('selectedGenres') as List)
            .map((e) => e.toString())
            .toList(),
        profilePicture: snapshot.get('profilePicture'),
        selectedLanguage: snapshot.get('selectedLanguage'));
  }
}
