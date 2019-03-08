import 'package:flutter/material.dart';
import 'package:invite_vn/statics/assets.dart';

class RadioGroup extends StatefulWidget {
  final bool row;
  final Map<int, String> values;
  final ValueChanged<int> currentValue;
  final int initValue;

  RadioGroup({
    Key key,
    this.row = false,
    this.values,
    this.initValue,
    this.currentValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateRadioGroup();
}

class _StateRadioGroup extends State<RadioGroup> {
  int currentSelected;
  int lastItem;

  @override
  void initState() {
    super.initState();
    lastItem = widget.values.keys.last;
  }


  @override
  void didUpdateWidget(RadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentSelected = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return buildDirection(
      children: widget.values.keys
          .map(
            (key) => RadioItem(
                  title: widget.values[key],
                  isSelected: currentSelected == key,
                  isLastItem: lastItem == key,
                  onTap: () {
                    setState(() {
                      currentSelected = key;
                      widget.currentValue(key);
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

  const RadioItem(
      {Key key, this.title, this.isSelected, this.onTap, this.isLastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
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
        ),
        VerticalDivider(
          width: isLastItem ? 0.0 : 32.0,
        )
      ],
    );
  }
}
