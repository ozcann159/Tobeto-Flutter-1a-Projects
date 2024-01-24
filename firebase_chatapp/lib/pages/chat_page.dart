 
import 'package:chatapptute/components/chat_buble.dart';
import 'package:chatapptute/components/custom_textfield.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:chatapptute/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageControlller = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(const Duration(microseconds: 500), () => scrollDown());
      }
    });
    Future.delayed(
      const Duration(milliseconds: 500),
    () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageControlller.dispose();
    super.dispose();
  }
  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }
  void sendMessage() async {
    if (_messageControlller.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverID, _messageControlller.text);
      _messageControlller.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Hata");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Yükleniyor..");
          }
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );
        });
  }
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data["senderID"] == _authService.getCurrentUser()!.uid;
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBuble(
              message: data["message"],
              isCurrentUser: isCurrentUser,
            ),
          ],
        ));
  }
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextField(
                            controller: _messageControlller,
                            hintText: "Mesaj Yaz",
                            obscureText: false,
                
                          ),
              )),
          Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 231, 85, 105), shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
