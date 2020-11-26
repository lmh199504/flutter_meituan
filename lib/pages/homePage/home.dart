import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 8, vsync: this, initialIndex: 2);
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation.value) {
        // print(_tabController.index);
      }
    });
  }

  _refresh() {
    print('刷新');
  }

  @override
  bool get wantKeepAlive => true;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle:
                      TextStyle(color: Colors.black, fontSize: 14),
                  isScrollable: true,
                  labelColor: Color(0xff1695e1),
                  indicator: const BoxDecoration(),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: '关注',
                    ),
                    Tab(
                      text: '话题',
                    ),
                    Tab(
                      text: '推荐',
                    ),
                    Tab(
                      text: '视频',
                    ),
                    Tab(
                      text: '图文',
                    ),
                    Tab(
                      text: '语玩',
                    ),
                    Tab(
                      text: '游戏',
                    ),
                    Tab(
                      text: '三坑',
                    ),
                  ],
                ),
                flex: 1,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 20,
                height: 20,
                child: Image.asset('lib/images/search.png'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: _refresh,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 1), //x,y轴
                    color: Colors.grey, //投影颜色
                    blurRadius: 5 //投影距离
                    )
              ]),
          child: Icon(
            Icons.refresh,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: [ListTile(title: Text('关注'))],
          ),
          ListView(
            children: [ListTile(title: Text('话题'))],
          ),
          ListView(
            children: [ListTile(title: Text('推荐'))],
          ),
          ListView(
            children: [ListTile(title: Text('视频'))],
          ),
          ListView(
            children: [ListTile(title: Text('图文'))],
          ),
          ListView(
            children: [ListTile(title: Text('语玩'))],
          ),
          ListView(
            children: [ListTile(title: Text('游戏'))],
          ),
          ListView(
            children: [ListTile(title: Text('三坑'))],
          )
        ],
      ),
    );
  }
}
