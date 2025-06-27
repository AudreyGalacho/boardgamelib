import 'package:flutter/material.dart';
import '../models/game.dart';

class DetailPage extends StatelessWidget {
  final Game game;

  const DetailPage({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(game.description),
      ),
    );
  }
}
