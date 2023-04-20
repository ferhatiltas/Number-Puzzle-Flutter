import 'dart:math';

import 'package:flutter/material.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({super.key});

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  GlobalKey gridKey = GlobalKey();
  var random = Random();

  List<List<String>> gridState = [[], [], [], [], [], [], [], [], []];
  var indexColor = Colors.white;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= 81; i++) {
      gridState[0].add(random.nextInt(10).toString());
      gridState[1].add(random.nextInt(10).toString());
      gridState[2].add(random.nextInt(10).toString());
      gridState[3].add(random.nextInt(10).toString());
      gridState[4].add(random.nextInt(10).toString());
      gridState[5].add(random.nextInt(10).toString());
      gridState[6].add(random.nextInt(10).toString());
      gridState[7].add(random.nextInt(10).toString());
      gridState[8].add(random.nextInt(10).toString());
    }
  }

  Widget _buildBody() {
    int gridStateLength = gridState.length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.builder(
            key: gridKey,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridStateLength,
              //childAspectRatio: 8.0 / 11.9
            ),
            itemBuilder: _buildGridItems,
            itemCount: gridStateLength * gridStateLength,
          ),
        ),
      ),
    ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    GlobalKey gridItemKey = new GlobalKey();

    return GestureDetector(
      onTapDown: (details) {
        for (var i = 0; i < gridState.length; i++) {
          for (var j = 0; j < gridState[i].length; j++) {
            gridState[i][j] = "";
          }
        }

        var _box = gridItemKey.currentContext?.findRenderObject();
        var _boxGrid = gridKey.currentContext?.findRenderObject();
        var position = (_boxGrid as RenderBox).localToGlobal(Offset.zero); //this is global position
        double gridLeft = position.dx;
        double gridTop = position.dy;

        double gridPosition = details.globalPosition.dy - gridTop;

        //Get item position
        int indexX = (gridPosition / (_box as RenderBox).size.width).floor().toInt();
        int indexY = ((details.globalPosition.dx - gridLeft) / _box.size.width).floor().toInt();

        if (gridState[indexX][indexY] == "Y") {
          gridState[indexX][indexY] = "";
        } else {
          gridState[indexX][indexY] = "Y";
          indexColor = Colors.red;
        }

        setState(() {});
      },
      onVerticalDragUpdate: (details) {
        selectItem(gridItemKey, details);
      },
      onHorizontalDragUpdate: (details) {
        selectItem(gridItemKey, details);
      },
      child: GridTile(
        key: gridItemKey,
        child: Container(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.grey.shade400 : Colors.white,
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  void selectItem(GlobalKey<State<StatefulWidget>> gridItemKey, var details) {
    var _boxItem = gridItemKey.currentContext?.findRenderObject();
    var _boxMainGrid = gridKey.currentContext?.findRenderObject();
    Offset position = (_boxMainGrid as RenderBox).localToGlobal(Offset.zero); //this is global position
    double gridLeft = position.dx;
    double gridTop = position.dy;

    double gridPosition = details.globalPosition.dy - gridTop;

    //Get item position
    int rowIndex = (gridPosition / (_boxItem as RenderBox).size.width).floor().toInt();
    int colIndex = ((details.globalPosition.dx - gridLeft) / _boxItem.size.width).floor().toInt();
    gridState[rowIndex][colIndex] = "Y";
    indexColor = Colors.red;
    setState(() {});
  }

  Widget _buildGridItem(int x, int y) {
    switch (gridState[x][y]) {
      case '':
        return Text(
          '6',
          style: TextStyle(color: Colors.black, fontSize: 23),
        );
      case 'Y':
        print('object');

        return Container(
          color: indexColor,
          width: 50,
          height: 50,
          child: Center(
              child: Text(
            '6',
            style: TextStyle(color: Colors.white, fontSize: 23),
          )),
        );
      case 'N':
        return Container(
          color: Colors.white,
        );
      default:
        return Text(gridState[x][y].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sayı Bulmaca'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildBody(),
          ],
        ),
      ),
    );
  }

  _gridItemTapped(int x, int y) {
    print("x is $x and Y is $y");
  }
}
