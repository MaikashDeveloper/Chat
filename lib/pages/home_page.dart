import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/my_drawer.dart';
import 'package:minimal_chat_app/components/user_tile.dart';
import 'package:minimal_chat_app/pages/chat_page.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // caht & auth services
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _builderUserList(),
    );
  }

  Widget _builderUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loaging...");
        }
        //return List view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItems(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItems(
      Map<String, dynamic> userData, BuildContext context) {
    // display all users
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user -> go to chat
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ChatPage(
                  reciverEmail: userData["email"],
                  recevidID: userData['uid'],
                );
              },
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
