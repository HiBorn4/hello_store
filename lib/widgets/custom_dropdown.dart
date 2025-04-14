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
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selected = widget.items.first;
  }

  void toggleDropdown() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void selectItem(String value) {
    setState(() {
      selected = value;
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.label == "Reviews") ...[
                  const Icon(Icons.switch_left_sharp, size: 20, color: Colors.orange),
                  const SizedBox(width: 6),
                ],
                Text(selected, style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) {
                return InkWell(
                  onTap: () => selectItem(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      children: [
                        if (widget.label == "Reviews") ...[
                          const Icon(Icons.switch_left_sharp, size: 18, color: Colors.orange),
                          const SizedBox(width: 6),
                        ],
                        Text(item, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
