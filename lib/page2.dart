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
            // About
            _buildCard(
              title: "About",
              content:
                  "Saya adalah seorang pelajar di SMK Wikrama Bogor jurusan Rekayasa Perangkat Lunak. Saya memiliki minat yang besar dalam pengembangan perangkat lunak dan teknologi. Saya selalu berusaha untuk belajar hal-hal baru dan mengembangkan keterampilan saya di bidang ini.",
              color: Colors.white,
            ),

            // History
            _buildCard(
              title: "History",
              content:
                  "SDN 2 Cicurug (2014-2019)\ MTS Assadah (2019-2023)\ SMK Wikrama Bogor (2023-Sekarang)",
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
              color: Colors.white,
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ), 
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map(
                    (skill) => Chip(
                      label: Text(
                        skill,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 34, 25, 159),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
