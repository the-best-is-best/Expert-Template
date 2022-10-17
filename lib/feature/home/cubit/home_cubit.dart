import 'package:chat_ui/app/network/failure.dart';
import 'package:chat_ui/feature/home/cubit/home_states.dart';
import 'package:chat_ui/feature/home/domain/models/home_model.dart';
import 'package:chat_ui/feature/home/domain/repository/repository.dart';
import 'package:chat_ui/models/favorite_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._repository) : super(InitHomeState());
  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);
  final Repository _repository;

  HomeModel? homeModel;

  Future<void> getHomeData() async {
    emit(GetDataHomeState());
    Either<Failure, HomeModel> response = await _repository.getHomeData();
    response.fold(
      (l) {
        debugPrint(l.message);
        emit(FailureHomeState(l.message));
      },
      (r) {
        homeModel = r;
        emit(LoadedHomeState());
      },
    );
  }

  bool isOpenMenu = false;
  void openMenu() {
    isOpenMenu = !isOpenMenu;
    emit(OpenMenuState());
  }

  Map<int, FavoriteModel> favoriteModel = {
    1: FavoriteModel(id: 1, expertsId: 1, status: false),
    2: FavoriteModel(id: 2, expertsId: 2, status: true)
  };
  void addFav(int expertId) {
    favoriteModel[expertId]!.status = !favoriteModel[expertId]!.status;
    emit(AddFavoriteState());
  }
}
