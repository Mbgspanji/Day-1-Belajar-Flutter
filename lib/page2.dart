import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foto Profil + Nama
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profil.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              "Moh. Bagus Panji Arifian",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // About
            _buildCard(
              title: "About",
              content: "Saya Adalah Seorang Junior Web Developer.",
              color: const Color.fromARGB(255, 252, 219, 138),
            ),

            // History
            _buildCard(
              title: "History",
              content:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              color: Colors.white,
            ),

            // Skill
            _buildSkillCard(
              title: "Skill",
              skills: [
                "HTML",
                "CSS",
                "Javascript",
                "Flutter",
                "Java",
                "PHP",
                "Laravel",
                "Node.js",
                "React",
                "Vue.js",
              ],
              color: const Color.fromARGB(255, 252, 219, 138),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSkillCard({
    required String title,
    required List<String> skills,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // supaya sejajar dengan History (card putih)
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul Skill (kuning)
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 252, 219, 138), // kuning
            ),
          ),
          const SizedBox(height: 12),

          // List skill dalam bentuk chips kuning dengan teks putih
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white, // teks putih
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(
                      255,
                      252,
                      219,
                      138,
                    ), // chip kuning
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
