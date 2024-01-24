
import 'package:chatapptute/components/custom_button.dart';
import 'package:chatapptute/components/custom_textfield.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final void Function()? onTap;
  LoginPage({super.key,required this.onTap});

  void login( BuildContext context) async {
final authService= AuthService();
try {
  await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
} catch (e) {
  showDialog(context: context, builder:(context) => AlertDialog(
    title: Text(e.toString()),
  ),);
}

  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.messenger_rounded,
                   size: 60, color: Color.fromARGB(255, 231, 85, 105)),
                  SizedBox(width: 10),
                  Text(
                    "C H A T A P P",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 28),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _emailController,
                obscureText: false,
                hintText: "Email",
              ),
              SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                obscureText: true,
                hintText: "Şifre",
              ),
                 SizedBox(height: 15),
              CustomButton(
                text: "Giriş Yap",
                onTap: ()=> login(context),
              ),
                 SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Üye değil misin?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}