import 'package:flutter/material.dart';
import 'main.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text("Account Info"),
        backgroundColor: Colors.purple[300],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.purple[200],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Abdelrahman Rezk',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                  ),
                  Text(
                    'Fine arts; Graphic Design',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.purple[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Account details
            _infoTile(Icons.person, "Username", "Abdelrahman"),
            _infoTile(Icons.email, "Email", "ngu_student@ngu.edu.eg"),
            _infoTile(Icons.school, "Major", "Fine arts; Graphic Design"),

            SizedBox(height: 40),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false, // Clears the stack
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.logout),
              label: Text(
                'Log Out',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.purple[400]),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
