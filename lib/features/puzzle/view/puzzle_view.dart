import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({super.key});

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: 100.w,
        height: 100.h,
        child: SizedBox(
          width: 100.w,
          height: 60.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: 81,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: index % 2 == 0 ? Colors.white : Colors.grey,
                    child: Center(
                        child: Text(
                      index.toString(),
                      style: TextStyle(fontSize: 16.sp),
                    )),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
