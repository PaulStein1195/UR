import 'package:flutter/material.dart';
import 'package:ur_opinion/models/data.dart';

/*class ScrollableTeams extends StatelessWidget {
  final _width;
  final _height;
  final _showTitle;
  final List<Game> _gameData;

  ScrollableTeams(this._width, this._height, this._showTitle, this._gameData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _gameData.map((_game) {
          return Column(
              children: [
                Container(
                  height: _height *0.8,
                  width: _width *0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_game.coverImage.url),
                    )
                  ),
                ),
                Text(_game.title)
              ],
          );
        }).toList(),
      ),
    );
  }
}
*/