
abstract class HomeStates {}

class HomeInitialStates extends HomeStates {}


class HomeLoadingStates extends HomeStates {}
class OnChangeStates extends HomeStates {}
class HomeSuccessStates extends HomeStates {}
class HomeErrorStates extends HomeStates {

}

class UserSelectedState extends HomeStates {
  final int index;

  UserSelectedState(this.index);
}

