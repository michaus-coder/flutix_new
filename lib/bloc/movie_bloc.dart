import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutix_new/models/models.dart';
import 'package:flutix_new/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(super.initialState);

  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovie) {
      List<Movie> movies = await MovieServices.getMovies(1) as List<Movie>;
      yield MovieLoaded(
          movies: movies
              .where((element) =>
                  !element.title.toLowerCase().contains('365') &&
                  !element.title.toLowerCase().contains('bois'))
              .toList());
    }
  }
}
