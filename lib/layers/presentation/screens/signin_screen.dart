import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});
  final RootStore _rootStore = RootStore();

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signIn() async {
    final supabase = Supabase.instance.client;
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (mounted) {
        context.showSnackBar('Check your email for a login link!');
        _emailController.clear();
        _passwordController.clear();
        context.go('/');
      }
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 780,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 78),
                  const Text(
                    'Привет!',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 32.0),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Заполните Свои данные илu\nпродолжите через социальные медиа',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
                  ),
                  const SizedBox(height: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Email'),
                      TextField(
                        obscureText: false,
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'xyz@gmail.com'),
                      ),
                      const SizedBox(height: 26),
                      const Text('Пароль'),
                      TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '••••••••'),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => {print('tap')},
                        child: const Text(
                          'Востановить',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 26),
                      CupertinoButton(
                          color: CupertinoColors.systemTeal,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          onPressed: () => _signIn(),
                          child: const Text('Войти'))
                    ],
                  ),
                  const SizedBox(height: 160),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Вы впервые?'),
                      Text('Создать пользователя'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
