import 'package:flutter/material.dart';
import 'messageData.dart';
import 'replayData.dart';

class Messaage extends StatefulWidget {
  Messaage({Key key}) : super(key: key);

  @override
  _MessaageState createState() => _MessaageState();
}

class _MessaageState extends State<Messaage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  List messageList = messageData;

  int _currentIndex = 1;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation.value) {
        // print(_tabController.index);
        this.setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  deleteAll() {
    print('清空消息');
  }

  List<Widget> getMessageList() {
    List<Widget> list = [
      SizedBox(
        height: 10,
      ),
      ListTile(
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xfffce632),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Transform(
            transform: Matrix4.rotationZ(0.5),
            origin: Offset(28, 28),
            child: Icon(
              Icons.send_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: Text('纸飞机列表'),
        subtitle: Text(''),
      )
    ];

    for (int i = 0; i < this.messageList.length; i++) {
      list.add(ListTile(
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xfffce632),
            borderRadius: BorderRadius.circular(28),
            // image: DecorationImage(
            //     image: AssetImage(messageList[i]['avator']),
            //     fit: BoxFit.contain),
          ),
          child: ClipOval(
            child: Image.asset(
              messageList[i]['avator'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(messageList[i]['username']),
        subtitle: Text(
          messageList[i]['lastMessage'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }

    return list;
  }

  List<Widget> getReplayList() {
    return replayData
        .map((e) => ListTile(
              leading: Container(
                width: 56,
                height: 56,
                child: ClipOval(
                  child: Image.asset(
                    '${e['avator']}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Text('@${e['username']}评论了：'),
              subtitle: Text('${e['lastMessage']}\n${e['time']}'),
              trailing: Image.asset('${e['trailing']}'),
            ))
        .toList();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                  child: TabBar(
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle:
                          TextStyle(color: Colors.black, fontSize: 14),
                      // isScrollable: true,
                      labelColor: Color(0xff1695e1),
                      controller: _tabController,
                      indicatorPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      indicatorSize: TabBarIndicatorSize.values[1],
                      tabs: [
                        Tab(
                          text: '提醒',
                        ),
                        Tab(
                          text: '私信',
                        )
                      ]),
                ),
                _currentIndex == 1
                    ? Positioned(
                        right: 20,
                        top: 15,
                        child: InkWell(
                          onTap: deleteAll,
                          child: Icon(
                            Icons.delete,
                            color: Color(0xff808080),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: TabBarView(controller: _tabController, children: [
        ListView(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xfffc6a7b),
                          ),
                          child: Image.asset('lib/images/bell.png'),
                        ),
                        Text('小右通知')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff42aefe),
                          ),
                          child: Image.asset('lib/images/Message.png'),
                        ),
                        Text('收到的@')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff46d7aa),
                          ),
                          child: Image.asset('lib/images/fans.png'),
                        ),
                        Text('新增粉丝')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xfffda160),
                          ),
                          // child:Icon ,
                          child: Image.asset('lib/images/addFriend.png'),
                        ),
                        Text('好友请求')
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [...this.getReplayList()],
              ),
            )
          ],
        ),
        ListView(
          children: getMessageList(),
        ),
      ]),
    );
  }
}
