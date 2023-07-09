import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({
    super.key,
    required this.body,
    required this.myDrawer,
    this.stackBodyWidth,
    this.myDrawerAreaWidth,
    this.open = false,
    this.drawerBgColor,
    this.dividerColor,
  });
  final Widget body;
  final Widget myDrawer;
  final double? stackBodyWidth;
  final double? myDrawerAreaWidth;
  final bool open;
  Color? drawerBgColor;
  Color? dividerColor;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  double maxSide = 245.0;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    setState(() {
      maxSide = widget.stackBodyWidth ?? 245.0;
    });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  // void toggle() => animationController.isDismissed
  //     ? animationController.forward()
  //     : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    var myDrawer = Scaffold(
      backgroundColor: widget.drawerBgColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: widget.myDrawerAreaWidth ??
                  MediaQuery.of(context).size.width * 0.65,
              child: widget.myDrawer,
            ),
          ],
        ),
      ),
    );
    var myChild = ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.open ? 45 : 0),
          bottomLeft: Radius.circular(widget.open ? 45 : 0)),
      child: Container(
        padding: !widget.open
            ? null
            : const EdgeInsets.only(left: 16, top: 5, bottom: 5),
        decoration: BoxDecoration(
          boxShadow: !widget.open
              ? null
              : [
                  BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                    color: widget.dividerColor ?? Colors.grey.withOpacity(0.5),
                    offset: const Offset(5, 5),
                    spreadRadius: 5,
                  )
                ],
        ),
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.open ? 45 : 0),
                bottomLeft: Radius.circular(widget.open ? 45 : 0)),
            child: widget.body),
      ),
    );
    widget.open ? animationController.forward() : animationController.reverse();
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        double slide = maxSide * animationController.value;
        double scale = 1 - (animationController.value * 0.3);
        return Stack(
          children: [
            myDrawer,
            Transform(
              transform: Matrix4.identity()
                ..translate(slide) //maxSide
                ..scale(scale), //0.5
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.open ? 45 : 0),
                      bottomLeft: Radius.circular(widget.open ? 45 : 0)),
                  child: myChild),
            ),
          ],
        );
      },
    );
  }
}
