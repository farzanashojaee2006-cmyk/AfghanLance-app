import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final TextEditingController searchController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String selectedFilter = "All";

  final List<String> filters = ["All", "Images", "Videos", "Files"];
  final List<Map<String, dynamic>> likedPosts = [
    {
      "username": "Sarah Ahmed",
      "time": "Posted 2 hours ago",
      "caption":
      "Looking for a Flutter developer to build a clean login and signup UI for a mobile app.",
      "likes": 120,
      "type": "app",
    },
    {
      "username": "Ali Khan",
      "time": "Posted yesterday",
      "caption":
      "Need a freelancer to write simple documentation for an app project.",
      "likes": 58,
      "type": "file",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              height: 55,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

                border: Border.all(color: Colors.grey.shade300),
              ),

              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: isDark ? Colors.white10 : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

             SizedBox(height: 20),

            // Filter Chips
            SizedBox(
              height: 45,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: filters.length,

                itemBuilder: (context, index) {
                  final filter = filters[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ChoiceChip(
                      label: Text(filter),

                      selected: selectedFilter == filter,

                      selectedColor: kThirdColor,

                      backgroundColor: Colors.white,

                      labelStyle: TextStyle(
                        color: selectedFilter == filter
                            ? Colors.white
                            : Colors.black,
                      ),

                      onSelected: (value) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

             SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('likedPosts').snapshots(),
                builder: (context, snapshot) {
                  List<Map<String, dynamic>> posts = likedPosts;

                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    posts = snapshot.data!.docs.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      data["docId"] = doc.id;
                      return data;
                    }).toList();
                  }

                  final searchText = searchController.text.toLowerCase();

                  posts = posts.where((post) {
                    final caption = post["caption"].toString().toLowerCase();
                    final username = post["username"].toString().toLowerCase();
                    final postType = post["type"].toString().toLowerCase();

                    final matchesSearch =
                        caption.contains(searchText) ||
                            username.contains(searchText);

                    final matchesFilter =
                        selectedFilter == "All" ||
                            selectedFilter.toLowerCase().contains(postType);

                    return matchesSearch && matchesFilter;
                  }).toList();

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (posts.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work_outline,
                            size: 90,
                            color: kThirdColor,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "No Project Found",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Projects you liked will appear here.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      final userId = FirebaseAuth.instance.currentUser!.uid;

                      final likedBy = List<String>.from(post["likedBy"] ?? []);

                      final isLiked = likedBy.contains(userId);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: kThirdColor,
                                  child: Text(
                                    post["username"][0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post["username"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        post["time"],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              post["caption"],
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final docRef =
                                    firestore.collection('likedPosts').doc(post["docId"]);

                                    if (isLiked) {
                                      await docRef.update({
                                        "likes": FieldValue.increment(-1),
                                        "likedBy": FieldValue.arrayRemove([userId]),
                                      });
                                    } else {
                                      await docRef.update({
                                        "likes": FieldValue.increment(1),
                                        "likedBy": FieldValue.arrayUnion([userId]),
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "${post["likes"]} Likes",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
