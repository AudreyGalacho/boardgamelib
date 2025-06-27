import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    final games = provider.games;

    return Scaffold(
      appBar: AppBar(title: Text("Jeux de plateau")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Rechercher un jeu...'),
              onChanged: provider.updateSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return Card(
                  child: ListTile(
                    title: Text(game.name),
                    subtitle: Text(game.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailPage(game: game)),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () => provider.addToFavorites(game),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
