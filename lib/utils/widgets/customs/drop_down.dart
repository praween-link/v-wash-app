import 'package:flutter/material.dart';

class CustomAppDropdown extends StatefulWidget {
  CustomAppDropdown(
      {super.key,
      required this.labelText,
      this.icon,
      required this.items,
      required this.onChange,
      this.padding,
      this.childPadding,
      this.color,
      this.childColor,
      this.childShadowColor,
      this.decoration});
  final Widget labelText;
  final List<Widget> items;
  Widget? icon;
  final Function(int) onChange;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? childPadding;
  Color? color;
  Color? childColor;
  Color? childShadowColor;
  Decoration? decoration;

  @override
  State<CustomAppDropdown> createState() => _CustomAppDropdownState();
}

class _CustomAppDropdownState extends State<CustomAppDropdown> {
  late GlobalKey actionKey;
  late double height, width, xPosition = 0, yPosition = 0;
  bool isOpen = false;
  late OverlayEntry floatingWidget;
  //

  double dropDownChildHeight = 0;
  double dropDownHeight = 200;
  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey("widget.labelText");
  }

  void findDropDownData() {
    RenderBox? renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    // prints.log("findDropDownData: ${{
    //   "height": height,
    //   "width": width,
    //   "xPosition": xPosition,
    //   "yPosition": yPosition,
    // }}");
  }

  OverlayEntry _floatingDropDown() {
    double screenHeight = MediaQuery.of(context).size.height;

    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (isOpen) {
                floatingWidget.remove();
                setState(() {
                  isOpen = false;
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          //

          Positioned(
            left: 0,
            width: width + (xPosition * 2),
            top: ((screenHeight - yPosition) >= dropDownHeight
                ? yPosition + height
                : null),
            bottom: ((screenHeight - yPosition) < dropDownHeight
                ? screenHeight - yPosition
                : null),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: dropDownHeight, minHeight: 60),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Wrap(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: xPosition,
                            right: xPosition,
                            bottom: (screenHeight - yPosition) < dropDownHeight
                                ? 0
                                : xPosition,
                            top: (screenHeight - yPosition) < dropDownHeight
                                ? xPosition
                                : 0),
                        decoration: BoxDecoration(
                          color: widget.childColor ??
                              Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              width: 0.5),
                          boxShadow: [
                            BoxShadow(
                              color: widget.childShadowColor ??
                                  Colors.grey.shade500.withOpacity(0.5),
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                              offset:
                                  (screenHeight - yPosition) < dropDownHeight
                                      ? const Offset(-2, -2)
                                      : const Offset(2, 2),
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ],
                        ),
                        // height: dropDownHeight,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.items.length,
                            itemBuilder: (context, index) => Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  widget.onChange(index);
                                  if (isOpen) {
                                    floatingWidget.remove();
                                    setState(() {
                                      isOpen = false;
                                    });
                                  }
                                },
                                child: widget.items[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    dropDownHeight = MediaQuery.of(context).size.height * 0.3;
    return WillPopScope(
      onWillPop: () async {
        if (isOpen) {
          floatingWidget.remove();
          setState(() {
            isOpen = false;
          });
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        key: actionKey,
        onTap: () {
          if (isOpen) {
            floatingWidget.remove();
          } else {
            findDropDownData();
            setState(() {
              floatingWidget = _floatingDropDown();
            });
            Overlay.of(context).insert(floatingWidget);
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          decoration: widget.decoration ??
              BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: widget.labelText,
              ),
              widget.icon ??
                  const Icon(
                    Icons.keyboard_arrow_down,
                    // color: isDarkMode(context) ? Colors.white : Colors.white,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  //
  @override
  dispose() {
    if (isOpen) {
      floatingWidget.remove();
      setState(() {
        isOpen = false;
      });
    }
    super.dispose();
  }
}

// class DropdownOpen {
//   static final DropdownOpen _dropdownOpen = DropdownOpen._initernal();

//   factory DropdownOpen() {
//     return _dropdownOpen;
//   }

//   DropdownOpen._initernal();
// }
