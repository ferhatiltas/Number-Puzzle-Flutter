import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/image_constants.dart';
import '../../../widgets/sizedBox/dynamic_veritical_space.dart';
import '../model/math_model.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({super.key});

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  GlobalKey gridKey = GlobalKey();
  var random = Random();

  List<List<String>> gridState = [[], [], [], [], [], [], [], [], []];
  List<List<String>> gridState0 = [[], [], [], [], [], [], [], [], []];
  List<String> selectedNumbers = [];
  String selectedNumber = '';
  var indexColor = Colors.white;
  bool isFirsLoad = true;
  String selectedLastNumber = '';
  List<MathModel> mathModelList = [];
  List<MathModel> mathModelList2 = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 9; i++) {
      gridState[0].add(random.nextInt(10).toString());
      gridState[1].add(random.nextInt(10).toString());
      gridState[2].add(random.nextInt(10).toString());
      gridState[3].add(random.nextInt(10).toString());
      gridState[4].add(random.nextInt(10).toString());
      gridState[5].add(random.nextInt(10).toString());
      gridState[6].add(random.nextInt(10).toString());
      gridState[7].add(random.nextInt(10).toString());
      gridState[8].add(random.nextInt(10).toString());

      gridState0[0].add(random.nextInt(10).toString());
      gridState0[1].add(random.nextInt(10).toString());
      gridState0[2].add(random.nextInt(10).toString());
      gridState0[3].add(random.nextInt(10).toString());
      gridState0[4].add(random.nextInt(10).toString());
      gridState0[5].add(random.nextInt(10).toString());
      gridState0[6].add(random.nextInt(10).toString());
      gridState0[7].add(random.nextInt(10).toString());
      gridState0[8].add(random.nextInt(10).toString());
    }
    for (var i = 0; i < gridState0.length; i++) {
      for (var j = 0; j < gridState0[i].length; j++) {
        if (j != 8 && gridState0[i][j] == gridState0[i][j + 1]) {
          var number = random.nextInt(10).toString();
          while (number == gridState0[i][j]) {
            number = random.nextInt(10).toString();
          }
          gridState0[i][j] = number;
        }
      }
    }
    if (isFirsLoad) {
      isFirsLoad = false;
    }
    for (var i = 0; i < 3; i++) {
      mathModelList.add(MathModel(number1: random.nextInt(9) + 1, number2: random.nextInt(9) + 1, number3: random.nextInt(9) + 1));
      mathModelList2.add(MathModel(number1: random.nextInt(9) + 1, number2: random.nextInt(9) + 1, number3: random.nextInt(9) + 1));
      if (mathModelList[i].number1 % 10 > 5) {
        while (mathModelList[i].number1 * mathModelList[i].number2 < mathModelList[i].number3) {
          mathModelList[i].number3 = random.nextInt(9) + 1;
        }
        if ((mathModelList[i].number1 * mathModelList[i].number2) - mathModelList[i].number3 < 10 &&
            (mathModelList[i].number1 * mathModelList[i].number2) + mathModelList[i].number3 < 10) {
          mathModelList[i].number3 = mathModelList[i].number3 * 10;
        }
      } else {
        while (mathModelList[i].number1 % mathModelList[i].number2 != 0) {
          mathModelList[i].number1 = random.nextInt(9) + 1;
          mathModelList[i].number2 = random.nextInt(9) + 1;
        }
        while (mathModelList[i].number1 / mathModelList[i].number2 < mathModelList[i].number3) {
          mathModelList[i].number3 = random.nextInt(9) + 1;
        }
        if ((mathModelList[i].number1 / mathModelList[i].number2) - mathModelList[i].number3 < 10 &&
            (mathModelList[i].number1 / mathModelList[i].number2) + mathModelList[i].number3 < 10) {
          mathModelList[i].number3 = mathModelList[i].number3 * 10;
        }
      }

      if (mathModelList2[i].number1 % 10 > 5) {
        while (mathModelList2[i].number1 * mathModelList2[i].number2 < mathModelList2[i].number3) {
          mathModelList2[i].number3 = random.nextInt(9) + 1;
        }
        if ((mathModelList2[i].number1 * mathModelList2[i].number2) - mathModelList2[i].number3 < 10 &&
            (mathModelList2[i].number1 * mathModelList2[i].number2) + mathModelList2[i].number3 < 10) {
          mathModelList2[i].number3 = mathModelList2[i].number3 * 10;
        }
      } else {
        while (mathModelList2[i].number1 % mathModelList2[i].number2 != 0) {
          mathModelList2[i].number1 = random.nextInt(9) + 1;
          mathModelList2[i].number2 = random.nextInt(9) + 1;
        }
        while (mathModelList2[i].number1 / mathModelList2[i].number2 < mathModelList2[i].number3) {
          mathModelList2[i].number3 = random.nextInt(9) + 1;
        }
        if ((mathModelList2[i].number1 / mathModelList2[i].number2) - mathModelList2[i].number3 < 10 &&
            (mathModelList2[i].number1 / mathModelList2[i].number2) + mathModelList2[i].number3 < 10) {
          mathModelList2[i].number3 = mathModelList2[i].number3 * 10;
        }
      }
    }
  }

  Widget _buildBody() {
    int gridStateLength = gridState.length;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 100.w,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w - 170,
                child: Text(
                  'Soruların tabloda gizlenmiş olan \ncevaplarını bakalım bulabilecek misiniz?\nCevapları bulduğunuz zaman ilgili \nkareleri sürükleme ile seçiniz.',
                ),
              ),
              Image.asset(
                ImageConstants.instance.example,
                height: 150,
                width: 150,
              )
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              key: gridKey,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridStateLength,
              ),
              itemBuilder: _buildGridItems,
              itemCount: gridStateLength * gridStateLength,
            ),
          ),
        ),
        DynamicVerticalSpace(height: 1.h),

        SizedBox(
          height: 10.h,
          child: ListView.builder(
              itemCount: mathModelList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var operator1 = mathModelList[index].number1 % 10 > 5 ? '*' : '/';
                var operator2 = mathModelList[index].number2 % 10 < 5 ? '+' : '-';
                var number1 = mathModelList[index].number1.toString();
                var number2 = mathModelList[index].number2.toString();
                var number3 = mathModelList[index].number3.toString();

                var operator12 = mathModelList2[index].number1 % 10 > 5 ? '*' : '/';
                var operator22 = mathModelList2[index].number2 % 10 < 5 ? '+' : '-';
                var number12 = mathModelList2[index].number1.toString();
                var number22 = mathModelList2[index].number2.toString();
                var number32 = mathModelList2[index].number3.toString();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('(' + number1 + ' ' + operator1 + ' ' + number2 + ')' + ' ' + operator2 + ' ' + number3, style: TextStyle(fontSize: 20)),
                    Text('(' + number12 + ' ' + operator12 + ' ' + number22 + ')' + ' ' + operator22 + ' ' + number32,
                        style: TextStyle(fontSize: 20)),
                  ],
                );
              }),
        ),

        DynamicVerticalSpace(height: 1.h),

        // Text(selectedLastNumber.toString()),
        Align(
            alignment: Alignment.center,
            child: CupertinoButton.filled(
                child: Text('Sonraki Oyun'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PuzzleView()),
                  );
                }))
      ]),
    );
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    GlobalKey gridItemKey = new GlobalKey();

    return GestureDetector(
      onTapDown: (details) {
        selectedNumbers.clear();
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
        findSelectedNumbers(true, indexX, indexY);
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

    findSelectedNumbers(false, rowIndex, colIndex);
    indexColor = Colors.red;
    setState(() {});
  }

  Widget _buildGridItem(int x, int y) {
    switch (gridState[x][y]) {
      case '':
        return Text(
          gridState0[x][y].toString(),
          style: TextStyle(color: Colors.black, fontSize: 23),
        );
      case 'Y':
        return Container(
          color: indexColor,
          width: 50,
          height: 50,
          child: Center(
              child: Text(
            gridState0[x][y].toString(),
            style: TextStyle(color: Colors.white, fontSize: 23),
          )),
        );
      case 'N':
        return Container(
          color: Colors.white,
        );
      default:
        return Text(
          gridState0[x][y].toString(),
          style: TextStyle(color: Colors.black, fontSize: 23),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sayı Bulmaca'),
        ),
        body: _buildBody());
  }

  _gridItemTapped(int x, int y) {
    print("x is $x and Y is $y");
  }

  String lastNumber = '';

  void findSelectedNumbers(bool isTap, int x, int y) {
    if (isTap) {
      print('secilen sayi ${gridState0[x][y]}');
      selectedNumbers.add(gridState0[x][y]);
      lastNumber = gridState0[x][y];
    } else {
      if (lastNumber != gridState0[x][y]) {
        selectedNumbers.add(gridState0[x][y]);
        print('secilen sayilar ${gridState0[x][y]}');
        var allNumber = '';
        for (var i = 0; i < selectedNumbers.length; i++) {
          allNumber = selectedNumbers[i] + allNumber;
          selectedLastNumber = allNumber.split('').reversed.join();
        }
      }
      lastNumber = gridState0[x][y];
    }
  }
}
