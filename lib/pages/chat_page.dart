import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/my_textfild.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String reciverEmail;
  final String recevidID;
  ChatPage({super.key, required this.reciverEmail, required this.recevidID});

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth services
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    // if there is something inside the textfild
    if (_messageController.text.isEmpty) {
      await _chatServices.sendMessage(recevidID, _messageController.text);

      // clear the text controller
      _messageController.clear();
    }
  }

  //final String _chatUserName = reciverEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciverEmail.replaceAll("@gmail.com", "")),
      ),
      body: Column(
        children: [
          // display all messages

          Expanded(
            child: _buildMessageList(),
          ),

          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatServices.getMessage(recevidID, senderID),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        // return List view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data['message']);
  }

  // build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        // textfield show take up most of the space
        Expanded(
          child: MyTextFild(
            hintText: "Type a Message..",
            obscureText: false,
            controller: _messageController,
          ),
        ),

        // send Button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.send),
        )
      ],
    );
  }
}
