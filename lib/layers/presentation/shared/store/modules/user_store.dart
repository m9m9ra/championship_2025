import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  int counter = 0;

  @action
  void incr() {
    counter++;
  }

  @action
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final AuthResponse res = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      print(res.user);
    } catch (e) {
      print(e);
    }
  }
}
