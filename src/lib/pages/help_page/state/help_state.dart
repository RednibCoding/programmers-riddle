import 'package:mobx/mobx.dart';

part 'help_state.g.dart';

class HelpState = _HelpStateBase with _$HelpState;

final HelpState helpState = HelpState();

abstract class _HelpStateBase with Store {
  @observable
  bool isUpdating = false;
}
