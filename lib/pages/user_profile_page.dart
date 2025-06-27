import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserSpacePage extends StatelessWidget {
  const UserSpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Mon espace")),
      body: Column(
        children: [
          if (user.username != null)
            Text('Bienvenue ${user.username}', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          const Text('Mes jeux favoris :'),
          Expanded(
            child: ListView.builder(
              itemCount: user.favorites.length,
              itemBuilder: (context, index) {
                final game = user.favorites[index];
                return ListTile(
                  title: Text(game.name),
                  subtitle: Text(game.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
