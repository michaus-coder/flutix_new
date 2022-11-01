part of 'extensions.dart';

extension FirebaseAuthExtension on FirebaseAuth {
  models.User convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      models.User(currentUser!.uid, currentUser!.email!,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
  Future<models.User> fromFireStore() async =>
      await UserServices.getUser(currentUser!.uid);
}
