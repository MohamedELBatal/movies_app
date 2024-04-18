part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init) RequestStatus getPopularStatus,
    @Default(RequestStatus.init) RequestStatus getUpComingStatus,
    @Default(RequestStatus.init) RequestStatus getTopRatedStatus,
    PopularModel? popularModel,
    UpComingModel? upComingModel,
    TopRatedModel? topRatedModel,
    Failures? popularFailure,
    Failures? upComingFailure,
    Failures? topRatedFailure,
  }) = _HomeState;
}
