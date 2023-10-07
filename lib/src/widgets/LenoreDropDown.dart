import 'package:flutter/material.dart';

class LenoreDropDown extends StatelessWidget {
  final dynamic value;
  final Function(dynamic newValue)? onChange;
  final BuildContext? context;
  final List<dynamic> items;
  final String? hint;
  final String? label;
  final IconData? icon;
  const LenoreDropDown({
    Key? key,
    this.value,
    required this.onChange,
    this.context,
    required this.items,
    this.hint,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          decoration: InputDecoration(
            focusColor: Colors.white,
            // contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.subtitle1,
            labelText: label,
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            border: OutlineInputBorder(
              borderSide: label == null ? BorderSide.none : BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            prefix: icon == null
                ? null
                : Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      this.icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          value: value,
          items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(
                '${value.title}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            );
          }).toList(),
          onChanged: (dynamic newValue) => onChange!(newValue!),
        ),
      ),
    );
  }
}
