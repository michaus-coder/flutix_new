part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  static Future<void> updateUser(model.User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<model.User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return model.User(id, data['email'],
        balance: data['balance'],
        profilePicture: data['profilePicture'],
        selectedGenres:
            (data['selectedGenres'] as List).map((e) => e.toString()).toList(),
        selectedLanguage: data['selectedLanguage'],
        name: data['name']);
  }
}
