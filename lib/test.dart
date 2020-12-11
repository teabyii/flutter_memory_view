import 'package:flutter/material.dart';

class BigImage extends StatelessWidget {
  static const title = '显示一个大图片';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: Image.asset('assets/a.jpg')));
  }
}

class SpecialClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SuperOperator extends StatelessWidget {
  static const title = '占用大量内存的操作';
  final List<SpecialClass> emm = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
          children: [
            RaisedButton(
                onPressed: () {
                  int count = 10000;
                  while (count > 0) {
                    emm.add(SpecialClass());
                    count -= 1;
                  }
                },
                child: Text(title))
          ],
        )));
  }
}

class TestController extends ValueNotifier<int> {
  TestController(int initialValue) : super(initialValue);
}

class MemoryLeaks extends StatefulWidget {
  static const title = '注册大量的回调函数';
  final TestController controller;

  MemoryLeaks(this.controller);

  @override
  _MemoryLeaksState createState() => _MemoryLeaksState();
}

class _MemoryLeaksState extends State<MemoryLeaks> {
  @override
  void initState() {
    super.initState();

    int count = 10000;
    while (count > 0) {
      widget.controller.addListener(() {
        print(1);
      });
      count -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('这个方法注册了很多事件'),
    );
  }
}
