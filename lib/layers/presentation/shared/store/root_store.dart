
// singleton in Dart
import 'package:matule/layers/presentation/shared/store/modules/user_store.dart';

class RootStore {
  RootStore._privateConstructor();
  
  static final RootStore _instance = RootStore._privateConstructor();

  factory RootStore() {
    return _instance;
  }

  final UserStore userStore = UserStore();
}