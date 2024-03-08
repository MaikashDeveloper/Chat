import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
    required this.OnTap,
  });

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passcontroller = TextEditingController();

  final void Function()? OnTap;

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmail(
          _emailcontroller.text, _passcontroller.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 60,
            ),
            const SizedBox(height: 15),
            const Text("Welcome"),
            const SizedBox(height: 15),
            MyTextFild(
              hintText: 'Email',
              obscureText: false,
              controller: _emailcontroller,
            ),
            MyTextFild(
              hintText: 'Password',
              obscureText: true,
              controller: _passcontroller,
            ),
            const SizedBox(height: 15),
            MyButton(
              onTap: () {
                login(context);
              },
              text: 'Login',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?  ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: OnTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
