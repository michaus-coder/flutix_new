part of 'models.dart';

class Credit extends Equatable {
  final String name, profilePath;
  Credit({required this.name, required this.profilePath});
  @override
  List<Object> get props => [name, profilePath];
}
