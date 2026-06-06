import 'package:flutter/material.dart';
import 'selectable_card.dart';

class OptionItem {
  final String title;
  final String subtitle;
  final IconData icon;

  const OptionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class OptionGrid extends StatelessWidget {
  final List<OptionItem> items;
  final String? selectedItem;
  final ValueChanged<String> onSelected;

  const OptionGrid({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: .98,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return SelectableCard(
          title: item.title,
          subtitle: item.subtitle,
          icon: item.icon,
          selected: selectedItem == item.title,
          onTap: () => onSelected(item.title),
        );
      },
    );
  }
}