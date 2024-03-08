import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_chat_app/models/message.dart';

class ChatServices {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();

        // resutn users
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String recevidID, message) async {
    // get current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // creat a new message
    Message newMessage = Message(
      senderID: currentUserEmail,
      senderEmail: currentUserId,
      reciverID: recevidID,
      message: message,
      timestamp: timestamp,
    );

    //creat chat room id  for tow users(Store ensure uniqueness)
    List<String> ids = [currentUserId, recevidID];
    ids.sort(); // sort the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomID = ids.join('_');
    // add new message to database
    await _firestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("messages")
        .add(
          newMessage.toMap(),
        );
  }

  // get message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    // construct a chatroomID for two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatroomID = ids.join('_');

    return _firestore
        .collection("chat_room")
        .doc(chatroomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
