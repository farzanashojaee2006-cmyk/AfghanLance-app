import 'package:flutter/material.dart';
import '../../constants.dart';
import 'option_grid.dart';
import 'other_input_box.dart';
import 'selected_summary_box.dart';

class SkillSelector extends StatelessWidget {
  final List<OptionItem> skills;
  final List<String> selectedSkills;
  final TextEditingController otherController;
  final ValueChanged<String> onToggle;
  final VoidCallback onAddOther;
  final ValueChanged<String> onRemove;

  const SkillSelector({
    super.key,
    required this.skills,
    required this.selectedSkills,
    required this.otherController,
    required this.onToggle,
    required this.onAddOther,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: skills.map((item) {
            if (item.title == "Other") {
              return _SkillChip(
                title: item.title,
                icon: item.icon,
                selected: false,
                onTap: () {},
              );
            }

            final selected = selectedSkills.contains(item.title);

            return _SkillChip(
              title: item.title,
              icon: item.icon,
              selected: selected,
              onTap: () => onToggle(item.title),
            );
          }).toList(),
        ),

        OtherInputBox(
          controller: otherController,
          hint: "Write your own skill...",
          buttonText: "Add",
          onSave: onAddOther,
        ),

        SelectedSummaryBox(
          title: "Selected skills",
          items: selectedSkills,
          onRemove: onRemove,
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _SkillChip({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected
              ? kThirdColor.withOpacity(isDark ? .20 : .10)
              : isDark
              ? const Color(0xFF1E1E1E)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? kThirdColor
                : isDark
                ? Colors.white12
                : Colors.black12,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 19,
              color: selected
                  ? kThirdColor
                  : isDark
                  ? Colors.white70
                  : Colors.black87,
            ), SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: selected
                    ? kThirdColor
                    : isDark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            if (selected) ...[
              SizedBox(width: 8),
              Icon(
                Icons.check_circle_rounded,
                size: 17,
                color: kThirdColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}