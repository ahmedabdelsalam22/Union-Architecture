import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/useCase/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';

import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_now_playing_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    // get now playing data
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    // get popular data

    on<GetPopularMoviesEvent>(_getPopularMovies);

    // get top rated data

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
            popularState: RequestState.error, popularMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(popularMovies: r, popularState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(topRatedMovies: r, topRatedState: RequestState.loaded),
      ),
    );
  }
}
