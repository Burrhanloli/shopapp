import 'package:flutter/material.dart';
import 'package:shopapp/Components/ThemeColors.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController _scrollController;

  bool isAppBarExpanded = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  bool get _changecolor {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: _changecolor
                    ? AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 500),
                        child: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text("Poduct",
                              style: TextStyle(
                                  fontSize: 27.0, fontWeight: FontWeight.bold)),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                kprimaryColor,
                                kprimaryDarkColor,
                                Colors.black87
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                      )
                    : FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("Poduct",
                            style: TextStyle(
                                fontSize: 27.0, fontWeight: FontWeight.bold)),
                        background: Image.network(
                          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: kprimaryDarkColor,
                    labelColor: ksecondaryTextColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Text(
                          "Info",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Tab(child: Text(
                        "Additional Info",
                        style: TextStyle(fontSize: 20.0),
                      )),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
