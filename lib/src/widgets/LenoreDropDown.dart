import 'package:flutter/material.dart';

class LenoreDropDown<T> extends StatelessWidget {
  final T? value;
  final String? title;
  final Function(T newValue)? onChange;
  final BuildContext? context;
  final List<T> items;
  final String? hint;
  final String? label;
  final IconData? icon;
  final TextStyle? style;
  const LenoreDropDown({
    Key? key,
    this.value,
    this.title,
    required this.onChange,
    this.context,
    required this.items,
    this.hint,
    this.label,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<T>(
          decoration: InputDecoration(
            focusColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.subtitle1,
            labelText: label,
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            border: OutlineInputBorder(
              borderSide: label == null ? BorderSide.none : BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: icon == null
                ? null
                : Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      this.icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          dropdownColor: Theme.of(context).colorScheme.background,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
          value: value,
          isDense: true,
          isExpanded: true,
          focusNode: FocusNode(),
          borderRadius: BorderRadius.circular(10),
          focusColor: Colors.transparent,
          items: items.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Container(
                decoration: BoxDecoration(),
                child: Text(
                  '${value!.toString()}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            );
          }).toList(),
          onChanged: (T? newValue) => onChange!(newValue!),
        ),
      ),
    );
  }
}
