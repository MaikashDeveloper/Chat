import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfild.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.OnTap});

  final TextEditingController _emailcontroller = TextEditingController();

  final void Function()? OnTap;
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _confirmpasscontroller = TextEditingController();

  void register(BuildContext context) {
    final auth = AuthService();
    if (_passcontroller.text == _confirmpasscontroller.text) {
      try {
        auth.signUpWithEmailPassword(
            _emailcontroller.text, _passcontroller.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.toString()),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Password don't match!"),
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
            const Text("Lets creat a account for you"),
            const SizedBox(height: 15),
            // Email box
            MyTextFild(
              hintText: 'Email',
              obscureText: false,
              controller: _emailcontroller,
            ),
            // password box
            MyTextFild(
              hintText: 'Password',
              obscureText: true,
              controller: _passcontroller,
            ),
            // confirm password box
            MyTextFild(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmpasscontroller,
            ),
            const SizedBox(height: 15),
            // register button
            MyButton(
              onTap: () {
                register(context);
              },
              text: 'Register',
            ),
            // register button
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have a account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: OnTap,
                  child: Text(
                    "Login now",
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
