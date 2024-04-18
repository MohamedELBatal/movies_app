part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getPopular() = GetPopularEvent;
  const factory HomeEvent.getUpComing() = GetUpComingEvent;
  const factory HomeEvent.getTopRated() = GetTopRatedEvent;
}
