import 'package:afghanlance/AppColor.dart';
import 'package:flutter/material.dart';


class ProjectCard extends StatelessWidget {
  final String title;
  final String company;
  final List<String> tags;
  final String budget;
  final String time;
  final String proposals;

  const ProjectCard({
    super.key,
    required this.title,
    required this.company,
    required this.tags,
    required this.budget,
    required this.time,
    required this.proposals
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            company,
            style: TextStyle(color: textLightColor, fontSize: 13),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: tags
                .map((tag) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                budget,
                style: TextStyle(
                  color:primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                time,
                style:TextStyle(color: Colors.grey, fontSize: 13),

              ),
            ],
          ),
          Text(proposals, style:TextStyle(
            color:primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),)
        ],
      ),
    );
  }
}