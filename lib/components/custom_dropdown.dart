import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton<T>(
          value: value,
          hint: Text('Select $title'),
          isExpanded: true,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
