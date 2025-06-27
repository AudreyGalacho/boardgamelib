import 'package:flutter/material.dart';
import '../models/game.dart';

class GameProvider extends ChangeNotifier {
  final List<Game> _games = [
    Game(id: '1', name: 'Catan', description: 'Un jeu de stratégie.'),
    Game(id: '2', name: '7 Wonders', description: 'Un jeu de civilisation.'),
  ];

  List<Game> _favorites = [];
  String _searchQuery = '';

  List<Game> get games => _searchQuery.isEmpty
      ? _games
      : _games.where((g) => g.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  List<Game> get favorites => _favorites;

  void addToFavorites(Game game) {
    if (!_favorites.contains(game)) {
      _favorites.add(game);
      notifyListeners();
    }
  }

  void removeFromFavorites(Game game) {
    _favorites.remove(game);
    notifyListeners();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
