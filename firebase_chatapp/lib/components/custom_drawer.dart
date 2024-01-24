
import 'package:chatapptute/pages/profile_page.dart';
import 'package:chatapptute/pages/settings_page.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  void logout() {
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
                DrawerHeader(
                    child:  ListTile(
                      title: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            radius: 40,
                            child: Icon(Icons.person,
                          color: Theme.of(context).colorScheme.background),
                          ),
                          SizedBox(height: 20),
                           Text("P R O F İ L İ M",
                              style:
                                  TextStyle(color: Color.fromARGB(255, 82, 82, 82))),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ));
                      },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text(
                      "M E S A J L A R I M",
                      style: TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                    ),
                    leading: Icon(Icons.message,
                        color: Theme.of(context).colorScheme.primary),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text("A Y A R L A R",
                        style:
                            TextStyle(color: Color.fromARGB(255, 82, 82, 82))),
                    leading: Icon(Icons.settings,
                        color: Theme.of(context).colorScheme.primary),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ));
                    },
                  ),
                ),
               
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("Ç I K I Ş   Y A P"),
                leading: Icon(Icons.logout,
                    color: Theme.of(context).colorScheme.primary),
                onTap: logout,
              ),
            )
          ],
        ));
  }
}
