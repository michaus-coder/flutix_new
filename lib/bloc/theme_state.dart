part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themData;
  const ThemeState(this.themData);

  @override
  List<Object> get props => [themData];
}
