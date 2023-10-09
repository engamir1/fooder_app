import 'package:flutter/material.dart';
import 'package:fooder_app/theme/app_theme.dart';
import 'package:fooder_app/widgets/circle_image.dart';

class AuthorCard extends StatefulWidget {
// 1
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
// 2
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageProvider: widget.imageProvider),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderTheme.lightTextTheme.displayMedium,
                  ),
                  Text(
                    widget.title,
                    style: FooderTheme.lightTextTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isFavorited ? Colors.red[400] : Colors.black12,
              ),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited;
                });
                const snackBar = SnackBar(content: Text('FavoritePressed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ],
      ),
    );
  }
}
