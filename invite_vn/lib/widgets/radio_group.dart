import 'package:flutter/material.dart';
import 'package:invite_vn/statics/assets.dart';

class RadioGroup extends StatefulWidget {
  final bool row;
  final List<String> titles;
  final ValueChanged<String> currentTitle;

  RadioGroup({Key key, this.row = false, this.titles, this.currentTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateRadioGroup();
}

class _StateRadioGroup extends State<RadioGroup> {
  String currentSelected;
  String lastItem;

  @override
  void initState() {
    super.initState();
    lastItem = widget.titles.last;
  }

  @override
  Widget build(BuildContext context) {
    return buildDirection(
      children: widget.titles
          .map(
            (title) => RadioItem(
                  title: title,
                  isSelected: currentSelected == title,
                  isLastItem: lastItem == title,
                  onTap: () {
                    setState(() {
                      currentSelected = title;
                      widget.currentTitle(title);
                    });
                  },
                ),
          )
          .toList(),
    );
  }

  Widget buildDirection({List<Widget> children}) {
    return widget.row ? Row(children: children) : Column(children: children);
  }
}

class RadioItem extends StatelessWidget {
  final double size = 20.0;
  final String title;
  final bool isSelected;
  final bool isLastItem;
  final GestureTapCallback onTap;

  const RadioItem({Key key, this.title, this.isSelected, this.onTap, this.isLastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                isSelected ? Assets.radioChecked : Assets.radioUncheck,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(title)
        ],
      ),
    ), VerticalDivider(width: isLastItem? 0.0 : 32.0,)],);
  }
}
