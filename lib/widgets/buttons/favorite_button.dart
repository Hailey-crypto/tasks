import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(this.isFavorite, this.onFavoriteChanged);

  final bool isFavorite;
  final void Function() onFavoriteChanged;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.onFavoriteChanged(),
      icon: widget.isFavorite
          ? Icon(Icons.star)
          : Icon(Icons.star_border, size: 24),
    );
  }
}
