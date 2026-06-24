import 'package:flutter/material.dart';
import '../../constants.dart';
import 'option_grid.dart';

class SelectionList extends StatelessWidget {
  final List<OptionItem> items;
  final String? selectedItem;
  final ValueChanged<String> onSelected;

  const SelectionList({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: items.map((item) {
        final selected = selectedItem == item.title;

        return GestureDetector(
          onTap: () => onSelected(item.title),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 220),
            width: double.infinity,
            margin:  EdgeInsets.only(bottom: 14),
            padding:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: selected
                  ? kThirdColor.withOpacity(isDark ? .18 : .08)
                  : isDark
                  ? Color(0xFF1E1E1E)
                  : Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: selected
                    ? kThirdColor
                    : isDark
                    ? Colors.white12
                    : Colors.black12,
                width: selected ? 1.6 : 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 30,
                  color: selected
                      ? kThirdColor
                      : isDark
                      ? Colors.white70
                      : Colors.black87,
                ), SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: selected
                              ? kThirdColor
                              : isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ), SizedBox(height: 5),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white54 : Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                if (selected)
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: kThirdColor,
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}