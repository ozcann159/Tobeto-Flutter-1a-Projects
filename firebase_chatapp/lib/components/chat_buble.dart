import 'package:chatapptute/pages/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble(
      {super.key, required this.message, required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser
              ? isDarkMode
                  ? Color.fromARGB(255, 245, 144, 157)
                  : Color.fromARGB(255, 231, 85, 105)
              : isDarkMode
                  ? Color.fromARGB(255, 231, 85, 105)
                  : Color.fromARGB(255, 245, 144, 157),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(message,
          style: TextStyle(
              color: isCurrentUser
                  ? Colors.white
                  : isDarkMode
                      ? Colors.white
                      : Colors.black)),
    );
  }
}
