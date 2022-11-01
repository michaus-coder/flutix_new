part of 'models.dart';

class RegistrationData {
  String name, email, password, selectedLang;
  List<String> selectedGenres;
  File profileImage;
  RegistrationData(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedGenres = const [],
      this.selectedLang = "",
      required this.profileImage});
}
