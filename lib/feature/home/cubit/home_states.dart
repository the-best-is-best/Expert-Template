abstract class HomeStates {}

class InitHomeState extends HomeStates {}

class GetDataHomeState extends HomeStates {}

class LoadedHomeState extends HomeStates {}

class FailureHomeState extends HomeStates {
  final String message;

  FailureHomeState(this.message);
}

class OpenMenuState extends HomeStates {}

class AddFavoriteState extends HomeStates {}
