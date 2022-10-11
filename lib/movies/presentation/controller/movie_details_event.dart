part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

}

class GetMovieDetailsEvent extends MovieDetailsEvent {

  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];

}


class GetMovieRecommendation extends MovieDetailsEvent{
  final int id;

  const GetMovieRecommendation(this.id);

  @override
  List<Object?> get props => [id];
}

