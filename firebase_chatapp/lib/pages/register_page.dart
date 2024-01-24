
 
import 'package:chatapptute/components/custom_button.dart';
import 'package:chatapptute/components/custom_textfield.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_confirmPasswordController.text == _passwordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {showDialog(context: context, builder:(context) => AlertDialog(
    title: Text(e.toString()),
  ),);}
    } else {
      showDialog(context: context, builder:(context) => AlertDialog(
    title: Text("Şifreler aynı değil"),
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
              SizedBox(
                height: 30,
              ),
              Text(
                "H E S A P   O L U Ş T U R",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 28),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: _emailController,
                obscureText: false,
                hintText: "Email",
              ),
               SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                obscureText: false,
                hintText: "Şifre",
              ),
               SizedBox(height: 15),
              CustomTextField(
                controller: _confirmPasswordController,
                obscureText: false,
                hintText: "Şifre tekrarı",
              ),
               SizedBox(height: 15),
              CustomButton(
                text: "Kayıt Ol",
                onTap:()=> register(context),
              ),
               SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Zaten üye misin?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
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