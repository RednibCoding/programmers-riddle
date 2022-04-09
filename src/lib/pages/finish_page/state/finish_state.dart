import 'package:mobx/mobx.dart';

part 'finish_state.g.dart';

class FinishState = _FinishStateBase with _$FinishState;

final FinishState finishState = FinishState();

abstract class _FinishStateBase with Store {
  @observable
  bool isUpdating = false;
}
