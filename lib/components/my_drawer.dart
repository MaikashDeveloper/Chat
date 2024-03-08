import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/pages/home_page.dart';
import 'package:minimal_chat_app/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              ),
              // how list title

              // home icon
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                ),
              ),

              // setting
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("S E T T I N G"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SettingPage();
                        },
                      ),
                    );
                  },
                ),
              ),

              // settings list title
              // logout list title
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                title: const Text("L O G O U T"),
                leading: const Icon(Icons.logout),
                onTap: logout,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
