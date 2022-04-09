import 'package:mobx/mobx.dart';

part 'menu_state.g.dart';

class MenuState = _MenuStateBase with _$MenuState;

final MenuState menuState = MenuState();

abstract class _MenuStateBase with Store {
  @observable
  bool isUpdating = false;
}
