
 
import 'package:chatapptute/components/custom_drawer.dart';
import 'package:chatapptute/components/user_tile.dart';
import 'package:chatapptute/pages/chat_page.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:chatapptute/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("M E S A J L A R I M"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
      ),
      drawer: const CustomDrawer(),
      body: _buildUserlist(),
    );
  }

  Widget _buildUserlist() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Hata");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Yükleniyor...");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserlistItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserlistItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userData["email"],
                    receiverID: userData["uid"],
                  ),
                ));
          });
    } else {
      return Container();
    }
  }
}
