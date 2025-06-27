import 'package:flutter/foundation.dart';
import '../models/game.dart';

class UserProvider extends ChangeNotifier {
  String? username;
  final List<Game> _favorites = [];

  List<Game> get favorites => _favorites;

  void login(String name) {
    username = name;
    notifyListeners();
  }

  void logout() {
    username = null;
    _favorites.clear();
    notifyListeners();
  }

  void toggleFavorite(Game game) {
    if (_favorites.any((g) => g.id == game.id)) {
      _favorites.removeWhere((g) => g.id == game.id);
    } else {
      _favorites.add(game);
    }
    notifyListeners();
  }

  bool isFavorite(Game game) {
    return _favorites.any((g) => g.id == game.id);
  }
}
