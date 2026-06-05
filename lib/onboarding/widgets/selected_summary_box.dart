import 'package:flutter/material.dart';
import '../../constants.dart';

class SelectedSummaryBox extends StatelessWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String>? onRemove;

  const SelectedSummaryBox({
    super.key,
    required this.title,
    required this.items,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      margin:  EdgeInsets.only(top: 18),
      padding:  EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark
            ?  Color(0xFF1E1E1E)
            : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: kThirdColor.withOpacity(.20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 14),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((item) {
              return Container(
                padding:  EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: kThirdColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kThirdColor.withOpacity(.25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),

                    if (onRemove != null) ...[
                      SizedBox(width: 8),

                      GestureDetector(
                        onTap: () => onRemove!(item),
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: kThirdColor,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}