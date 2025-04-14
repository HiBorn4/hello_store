import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final List<String> items;

  const CustomDropdown({super.key, required this.label, required this.items});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dropdownHeight = screenHeight * 0.06; // ~6% of screen height

    return Container(
        height: dropdownHeight,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Center(
          child: DropdownButton<String>(
            value: selected,
            onChanged: (value) {
              if (value != null) {
                setState(() => selected = value);
              }
            },
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Row(
                  children: [
                    if (widget.label == "Reviews") ...[
                      const Icon(Icons.switch_left_sharp, size: 18, color: Colors.orange),
                      const SizedBox(width: 6),
                    ],
                    Text(item),
                  ],
                ),
              );
            }).toList(),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(6),
            style: const TextStyle(fontSize: 14, color: Colors.black),
            isDense: true,
          ),
        ),
      );
    
  }
}
