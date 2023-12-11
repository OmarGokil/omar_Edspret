part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}
final class BannerLoading extends BannerState {}
final class BannerSuccess extends BannerState {
  final List<BannerData> bannerList;

  BannerSuccess({required this.bannerList});
}

final class BannerFailed extends BannerState {
  final String errorMessage;

  BannerFailed({required this.errorMessage});
}
