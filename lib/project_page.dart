import 'package:flutter/material.dart';
import '../constants.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();

}

class _ProjectsPageState extends State<ProjectsPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Images",
    "Videos",
    "Files",
  ];
  final List<Map<String, dynamic>> likedPosts = [
    {
      "username": "Sarah Ahmed",
      "time": "2 hours ago",
      "caption":
      "Today I completed the UI for our Flutter project. Hope everyone likes it!",
      "likes": 120,
      "type": "image",
    },
    {
      "username": "Ali Khan",
      "time": "Yesterday",
      "caption":
      "Finished the documentation for the project.",
      "likes": 58,
      "type": "file",
    },
  ];
  @override

  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF121212) : kFirstColor,
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Search Bar
            Container(
              height: 55,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: TextField(
                controller: searchController,

                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),

                  hintText: "Search liked posts",

                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

            Expanded(
              child: likedPosts.isEmpty

                  ? Center(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Icon(
                      Icons.favorite_border,
                      size: 90,
                      color: kThirdColor,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "No Liked Posts",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Posts you like will appear here.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],

                ),

              )

                  : ListView.builder(

                itemCount: likedPosts.length,

                itemBuilder: (context, index) {

                  final post = likedPosts[index];

                  return Container(

                    // 👇 PASTE YOUR OLD POST CARD HERE
                    margin: const EdgeInsets.only(bottom: 20),

padding: const EdgeInsets.all(15),

decoration: BoxDecoration(
color: Colors.white,

borderRadius: BorderRadius.circular(15),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 5,
),
],
),

child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,

children: [

// Header
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

const Icon(Icons.favorite,
color: Colors.red),
],
),

const SizedBox(height: 15),

// Caption
Text(
post["caption"],
style: const TextStyle(
fontSize: 15,
),
),

  const SizedBox(height: 15),



const SizedBox(height: 15),

Row(
children: [

IconButton(
onPressed: () {
// Remove from liked posts later
},

icon: const Icon(
Icons.favorite,
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

              ),
            ),
          ],
        ),
      ),
    );
  }
}







