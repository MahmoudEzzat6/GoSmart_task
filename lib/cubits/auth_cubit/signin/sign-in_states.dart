
abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}


class LoginLoadingStates extends LoginStates {}

class UserSelectedState extends LoginStates {
  final int index;

  UserSelectedState(this.index);
}

class LoginSuffixIconsStates extends LoginStates {}
class LoginAgreeStates extends LoginStates {}
class LoginPhoneValidationState extends LoginStates {}