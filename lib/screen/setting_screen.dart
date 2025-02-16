import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: GoogleFonts.nunito(
            fontSize: ht * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/df/f7/48/dff748e4bd6b8282339b739113f61326.jpg'),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ajay Devmurari",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(
                        "Flutter Developer",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSettingsOption(
                Icons.person, "Account", "Manage your account"),
            _buildSettingsOption(
                Icons.notifications, "Notifications", "Customize your alerts"),
            _buildSettingsOption(
                Icons.lock, "Privacy", "Manage security settings"),
            _buildSettingsOption(
                Icons.language, "Language", "Change app language"),
            _buildSettingsOption(Icons.info, "About App", "Movie App"),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          leading: Icon(
            icon,
            color: Colors.blueAccent,
            size: 32,
          ),
          children: [
            SizedBox(
              height: 40,
              child: Text(
                subtitle,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
