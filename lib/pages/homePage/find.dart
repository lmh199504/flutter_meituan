import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'findData.dart';

class Find extends StatefulWidget {
  Find({Key key}) : super(key: key);

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> with AutomaticKeepAliveClientMixin {
  List list = [];
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      // print(context);
      this.setState(() {
        this.list = findData;
      });
    });
  }

  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;
  // List<NewsViewModel> list = List.from(newsList);
  @override
  void initState() {
    super.initState();
    this.list.addAll(findData);
    this.scrollController.addListener(() {
      // 滑动到底部的关键判断

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

    getContent();
  }

  Future loadMoreData() {
    print('加载新的数据');

    return Future.delayed(Duration(seconds: 1), () {
      var oldList = list;
      oldList.addAll(findData);
      setState(() {
        this.list = oldList;
        this.isLoading = false;
      });
    });
  }

  List<Widget> getContent() {
    // return this.list.map((v) {
    //   return Container(child: Text('$v'));
    // }).toList();
    List<Widget> widgetList = [
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '筛选：男生/女生',
              style: TextStyle(
                color: Color(0xffbebebe),
              ),
            ),
            InkWell(
              onTap: () {
                print('筛选条件');
              },
              child: Icon(
                Icons.menu,
                color: Color(0xffbebebe),
              ),
            )
          ],
        ),
      )
    ];
    for (var i = 0; i < this.list.length + 1; i++) {
      if (i < this.list.length) {
        widgetList.add(UsreItem(list[i]));
      } else {
        widgetList.add(renderBottom());
      }
    }

    return widgetList;
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          // '上拉加载更多',
          '',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color(0xfffafafa),
          ),
          preferredSize: Size.fromHeight(0),
        ),
        body: RefreshIndicator(
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            physics: BouncingScrollPhysics(),
            controller: this.scrollController,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '发现',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 160,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/images/2.jpg'),
                        )),
                  ),
                  Container(
                    height: 160,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/images/3.jpg'),
                        )),
                  ),
                  Container(
                    height: 160,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/images/4.jpg'),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              StickyHeader(
                header: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color(0xfffafafa),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '扩列',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.face_rounded,
                                    color: Color(0xff6e4de6),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '扩列卡',
                                    style: TextStyle(
                                      color: Color(0xff6e4de6),
                                    ),
                                  )
                                ],
                              ))
                        ])),
                content: Column(children: getContent()),
              ),
            ],
          ),
          onRefresh: this.onRefresh,
        ));
  }
}

// ignore: must_be_immutable
class UsreItem extends StatefulWidget {
  Map item;

  UsreItem(this.item, {Key key}) : super(key: key);
  @override
  _UsreItemState createState() => _UsreItemState(this.item);
}

class _UsreItemState extends State<UsreItem> {
  Map item;

  _UsreItemState(this.item);

  @override
  void initState() {
    super.initState();
  }

  tabItem() {
    if (item['islike'] == true) {
      this.setState(() {
        item['islike'] = false;
        item['start']--;
      });
    } else {
      this.setState(() {
        item['islike'] = true;
        item['start']++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return item != null
        ? Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //左边人物信息
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 10),
                            child: ClipOval(
                              child: Image.network(
                                item['avator'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //username
                          Text(
                            item['username'],
                            style: TextStyle(color: Color(0xff727272)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.5),
                              color: item['sex'] == 0
                                  ? Color(0xfffb5885)
                                  : Color(0xff119eeb),
                            ),
                            child: Image.network(
                              item['sex'] == 0
                                  ? 'https://ergouzi.oss-ap-southeast-2.aliyuncs.com/flutter_zuiyou/girl.png'
                                  : 'https://ergouzi.oss-ap-southeast-2.aliyuncs.com/flutter_zuiyou/boy.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //右边爱心点赞
                    InkWell(
                      onTap: this.tabItem,
                      child: Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xffececec),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Row(
                          children: [
                            item['islike']
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Color(0xffda8da7),
                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('${item['start']}')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text('${item['desc']}', textAlign: TextAlign.left),
              ],
            ),
          )
        : Container();
  }
}
