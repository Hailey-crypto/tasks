import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Favorite ⚪️
class FavoriteState extends ChangeNotifier {
  bool isFavorite = false;

  bool get _isFavorite => isFavorite;

  void onFavoriteChanged() {
    isFavorite = !_isFavorite;
    notifyListeners();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final favoriteState = context.watch<FavoriteState>();

    return IconButton(
      onPressed: () => favoriteState.onFavoriteChanged(),
      icon: favoriteState.isFavorite
          ? Icon(Icons.star)
          : Icon(Icons.star_border, size: 24),
    );
  }
}
