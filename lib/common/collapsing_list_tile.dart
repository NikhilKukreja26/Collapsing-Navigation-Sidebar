import 'package:flutter/material.dart';

import '../theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData iconData;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  const CollapsingListTile({
    Key key,
    @required this.title,
    @required this.iconData,
    this.animationController,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(
      begin: 220.0,
      end: 70.0,
    ).animate(widget.animationController);

    sizedBoxAnimation = Tween<double>(
      begin: 10.0,
      end: 0.0,
    ).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widthAnimation.value,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.iconData,
              color: widget.isSelected ? selectedColor : Colors.white30,
              size: 38.0,
            ),
            SizedBox(
              width: sizedBoxAnimation.value,
            ),
            (widthAnimation.value >= 220)
                ? Text(
                    widget.title,
                    style: widget.isSelected
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
