import 'package:flutter/material.dart';

class LenoreCheckBox extends StatelessWidget {
  final bool value;
  final Color? activeColor;
  final Function(bool?) onChanged;
  final FocusNode? focusNode;
  final String? textString;
  final Widget? leading;
  final TextStyle? style;
  const LenoreCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.focusNode,
    this.textString,
    this.leading,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              activeColor: activeColor ?? Theme.of(context).primaryColor,
              focusNode: focusNode,
            ),
          ),
          textString != null
              ? Expanded(
                  child: Container(
                    child: Text('$textString', maxLines: 2, overflow: TextOverflow.ellipsis, style: style ?? Theme.of(context).textTheme.bodyLarge),
                  ),
                )
              : Container(),
          leading ?? Container(),
        ],
      ),
    );
  }
}
