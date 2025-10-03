import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              // Foto Profil
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profil.jpg'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Moh. Bagus Panji Arifian',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [


                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     const Icon( Icons.person, color: Colors.black),
                    //     SizedBox(width: 8),
                    //     Text(
                    //       'Moh. Bagus Panji Arifian',
                    //       style: TextStyle(
                    //         fontSize: 24,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Icon(Icons.email, color: Colors.black),
                    //     const SizedBox(width: 8),
                    //     GestureDetector(
                    //       onTap: () {
                    //         _launchURL("mailto:miyukazuki188@email.com");
                    //       },
                    //       child: const Text(
                    //         'Email: miyukazuki188@email.com',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.blue,
                    //           decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // const SizedBox(height: 10),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Icon(FontAwesomeIcons.phone, color: Colors.black),
                    //     const SizedBox(width: 8),
                    //     GestureDetector(
                    //       onTap: () {
                    //         _launchURL("https://wa.me/6283115749647");
                    //       },
                    //       child: const Text(
                    //         'Whatsapp: 083115749647',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.blue,
                    //           decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),

              // const SizedBox(height: 20),

              _buildCard(
                title: "About",
                content:
                    "Saya adalah seorang pelajar di SMK Wikrama Bogor jurusan Rekayasa Perangkat Lunak. Saya memiliki minat yang besar dalam pengembangan perangkat lunak dan teknologi.",
                color: Colors.white,
              ),

              _buildCard(
                title: "History",
                content:
                    "SDN 2 Cicurug (2014-2019)\ MTS Assadah (2019-2023)\ SMK Wikrama Bogor (2023-Sekarang)",
                color: Colors.white,
              ),

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
      ),
    );
  }

  // Fungsi untuk card biasa
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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(
                      skill,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
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
        ],
      ),
    );
  }

  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka $url';
    }
  }
}
