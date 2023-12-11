import 'package:flutter_application_2/repository/banner/banner__repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/model/banner/banner__response.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc({required this.bannerRepository}) : super(BannerInitial()) {
    on<BannerEvent>((events, emit) async{
      if(events is GetBannerListEvent){
        emit(BannerLoading());


        final data = await bannerRepository.getBannerList();

        emit (BannerSuccess(bannerList: data));


      }
    });
  }
}
