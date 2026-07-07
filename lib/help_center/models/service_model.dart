import 'package:afghanlance/help_center/models/project_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class ProjectService {
  final db = FirebaseFirestore.instance;

  Stream<List<ProjectModel>> getProjects() {
    return db.collection('projects').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProjectModel.fromJson(doc.data());
      }).toList();
    });
  }
}