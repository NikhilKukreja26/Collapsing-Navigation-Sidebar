import 'package:flutter/material.dart';

import '../models/navigation_model.dart';
import '../common/collapsing_list_tile.dart';
import '../theme.dart';
import '../dashboard.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 220.0;
  double minWidth = 70.0;
  AnimationController _animationController;
  bool isCollapsed = false;
  Animation<double> _widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) => Material(
        elevation: 8.0,
        child: Container(
          width: _widthAnimation.value,
          color: drawerBackgroundColor,
          child: Column(
            children: <Widget>[
              CollapsingListTile(
                title: 'Barry Allen',
                iconData: Icons.person,
                animationController: _animationController,
              ),
              const Divider(
                color: Colors.grey,
                height: 40.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, int index) {
                    return Divider(
                      height: 12.0,
                    );
                  },
                  itemCount: navigationItems.length,
                  itemBuilder: (context, int index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = index;
                        if (currentSelectedIndex == 0) {
                          Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              )
                              .then((value) => setState(() {
                                    _animationController.forward();
                                  }));
                        }
                      });
                    },
                    child: CollapsingListTile(
                      title: navigationItems[index].title,
                      iconData: navigationItems[index].iconData,
                      animationController: _animationController,
                      isSelected: currentSelectedIndex == index,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  progress: _animationController,
                  icon: AnimatedIcons.close_menu,
                  color: selectedColor,
                  size: 50.0,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      );
}
