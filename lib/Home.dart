
import 'package:afghanlance/SkillCard.dart';
import 'package:afghanlance/projactCards.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/Conestant.dart';


class HomePage extends StatefulWidget {
  final bool isClient;
  const HomePage({super.key,required this.isClient});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  bool isFreelancer=true;
  late bool isClient;
  @override
  void initState() {
    super.initState();
    isClient = widget.isClient;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color:primaryColor),
              accountName: Text("Farzana"),
              accountEmail: Text("farzanashojaee2006@gmail.com"),

              currentAccountPicture: CircleAvatar(
                backgroundColor:backgroundColor,
                child: Icon(Icons.person,color:primaryColor, size: 40),
              ),

            ),
            ListTile(leading: Icon(Icons.person,color: primaryColor
              ,),title: Text("Profile"),onTap: (){},),
            ListTile(leading:Icon(Icons.settings,color:primaryColor,),title: Text("Settings"),onTap: (){},),

            ListTile(leading: Icon(Icons.question_mark_outlined,color: primaryColor
              ,),title: Text("Help & Support"),onTap: (){},),
            ListTile(leading: Icon(Icons.logout,color:primaryColor
              ,),title: Text("Log Out"),onTap: (){},),
          ],
        ),
      ),

      backgroundColor:backgroundColor,

      appBar: AppBar(
        backgroundColor:backgroundColor,
        title: const Text(
          'Afghanlance',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40,30),
                backgroundColor:primaryColor,
                padding: const EdgeInsets.symmetric(

                ),
              ),
              onPressed: () {},
              child: Icon(Icons.add,color: Colors.white,),
            ),
          )
        ],
      ),

      body:isClient
          ? ClientView(isClient:isClient)
          : FreelancerView(isClient: isClient,),



    );

  }
}
class FreelancerView extends StatelessWidget {
  final bool isClient;
  FreelancerView({super.key,required this.isClient});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              cursorColor: Colors.grey,
              style:TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search projects, skills and ...',
                prefixIcon:  Icon(Icons.search, color: Colors.grey),
                suffixIcon:  Icon(Icons.tune, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Container(
            margin:  EdgeInsets.symmetric(horizontal: 16),
            padding:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Your Perfect Project',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Thousands of projects waiting for your skills. Show your talent and win best projects.',
                        style: TextStyle(
                          color:textLightColor,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:backgroundColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Browse Projects',
                          style: TextStyle(color:primaryColor ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 140,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F9F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Icon(
                    Icons.laptop_mac,
                    size: 85,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Suggested Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 8),

          ProjectCard(
            title: 'Senior Flutter Developer',
            company: 'Ahmad Khan',
            tags: ['Flutter', 'Dart'],
            budget: '\$25 - \$35/hr',
            time: 'Available Now',
            proposals: "5 proposals",
          ),

          ProjectCard(
            title: 'UI/UX Designer',
            company: 'Zahra Haidari',
            tags: ['Figma', 'UX'],
            budget: '\$20 - \$30/hr',
            time: '2 days ago',
            proposals: "12 proposals",
          ),

          ProjectCard(
            title: 'Backend Developer',
            company: 'Novin Startup',
            tags: ['Node.js', 'MongoDB'],
            budget: '\$500 - \$900',
            time: '3 days ago',
            proposals: "8 proposals",
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text(
                  'Popular Skills',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('View All',
                    style: TextStyle(color:primaryColor)),
              ],
            ),
          ),

          SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children:[
                SkillCard(icon: Icons.phone_android, label: 'Mobile Dev'),
                SkillCard(icon: Icons.design_services, label: 'Logo Design'),
                SkillCard(icon: Icons.web, label: 'Web Dev'),
                SkillCard(icon: Icons.translate, label: 'Translation'),
                SkillCard(icon: Icons.code, label: 'Programming'),
              ],
            ),
          ),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}



class ClientView extends StatelessWidget {
  final bool isClient;

  ClientView({super.key, required this.isClient});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search projects, skills and ...',
                prefixIcon:  Icon(Icons.search, color: Colors.grey),
                suffixIcon:  Icon(Icons.tune, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Container(
            margin:EdgeInsets.symmetric(horizontal: 16),
            padding:EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Your Perfect Freelancer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Thousands of talented Afghan freelancer ready for your project. Post your job and get proposals from skilled professional ',
                        style: TextStyle(
                          color:textLightColor,
                          height: 1.4,
                        ),
                      ), SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD7EAEE),
                        ),
                        onPressed: () {},
                        child:Text(
                          'Browse Projects',
                          style: TextStyle(color: Color(0xFF1D837F)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 140,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F9F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.laptop_mac,
                    size: 85,
                    color:primaryColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Suggested Projects',style:
                TextStyle(fontSize: 18,fontWeight:FontWeight.bold)
            ),
          ),

           SizedBox(height: 8),

           ProjectCard(
            title: 'Senior Flutter Developer',
            company: 'Ahmad Khan',
            tags: ['Flutter', 'Dart'],
            budget: '\$25 - \$35/hr',
            time: 'Available Now',
            proposals: "5 proposals",
          ),

         ProjectCard(
            title: 'UI/UX Designer',
            company: 'Zahra Haidari',
            tags: ['Figma', 'UX'],
            budget: '\$20 - \$30/hr',
            time: '2 days ago',
            proposals: "12 proposals",
          ),

          ProjectCard(
            title: 'Backend Developer',
            company: 'Novin Startup',
            tags: ['Node.js', 'MongoDB'],
            budget: '\$500 - \$900',
            time: '3 days ago',
            proposals: "8 proposals",
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Skills',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('View All',
                    style: TextStyle(color: primaryColor)),
              ],
            ),
          ),

          SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children:  [
                SkillCard(icon: Icons.phone_android, label: 'Mobile Dev'),
                SkillCard(icon: Icons.design_services, label: 'Logo Design'),
                SkillCard(icon: Icons.web, label: 'Web Dev'),
                SkillCard(icon: Icons.translate, label: 'Translation'),
                SkillCard(icon: Icons.code, label: 'Programming'),
              ],
            ),
          ),
          SizedBox(height: 80),

        ],),
    );
  }
}

