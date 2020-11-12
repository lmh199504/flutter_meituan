import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Find extends StatefulWidget {
  Find({Key key}) : super(key: key);

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  List list = new List();
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      print(context);
    });
  }

  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  // List<NewsViewModel> list = List.from(newsList);
  @override
  void initState() {
    super.initState();

    this.scrollController.addListener(() {
      // 滑动到底部的关键判断
      print(1111);
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        // 开始加载数据
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  Future loadMoreData() {
    print('加载新的数据');
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        this.list.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      child: ListView(
        physics: BouncingScrollPhysics(),
        controller: this.scrollController,
        children: [
          Text('1111'),
          Text('1111'),
          Text('1111'),
          Text('1111'),
          Text('1111'),
          Text('1111'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          Text('我是内荣'),
          StickyHeader(
            header: Container(
              color: Colors.black,
              width: double.infinity,
              height: 50,
            ),
            content: Column(children: [
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
              Text('我是内荣'),
            ]),
          ),
        ],
      ),
      onRefresh: this.onRefresh,
    ));
  }
}
