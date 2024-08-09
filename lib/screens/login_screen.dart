import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/providers/user_provider.dart';
import 'package:my_store/screens/widgets/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.read(userProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldApp(
                controller: _usernameController,
                text: AppConstants.username,
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFormFieldApp(
                controller: _passwordController,
                text: AppConstants.password,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userNotifier.register(
                          _usernameController.text,
                          _passwordController.text,
                        );
                        context.go('/home');
                      }
                    },
                    child: const Text(AppConstants.register),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final isLogin = await userNotifier.login(
                          _usernameController.text,
                          _passwordController.text,
                        );

                        if (isLogin) {
                          context.go('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(AppConstants.textLogin)),
                          );
                        }
                      }
                    },
                    child: const Text(AppConstants.login),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
