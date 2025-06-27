import 'package:flutter/material.dart';
import '../../pages/user_profile_page.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Board Games Library App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Mon espace',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserSpacePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/'); // si tu as défini des routes nommées
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoris'),
              onTap: () {
                Navigator.pushNamed(context, '/favoris'); // idem
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                // ajouter la logique ici
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
