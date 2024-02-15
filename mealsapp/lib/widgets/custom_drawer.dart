import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Favoriler'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('Başlangıçlar'),
            onTap: () {
             
            },
            leading: Icon(
              Icons.fastfood,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('Ara Sıcaklar'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.fastfood_outlined,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('Ana Yemekler'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.fastfood_rounded,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('Tatlılar'),
            onTap: () {
             
            },
            leading: Icon(
              Icons.fastfood_outlined,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('İçecekler'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.local_drink,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
          ListTile(
            title: const Text('Mezeler'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.cookie,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
