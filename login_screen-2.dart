import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'loginscreen2.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.network(
              'https://th.bing.com/th/id/R.68844cd1fb304f37a2a1f6595ae44eef?rik=bS96q3a%2fU7Ne2g&riu=http%3a%2f%2fgratefulgrumbles.com%2fwp-content%2fuploads%2f2017%2f05%2fcropped-IMG_1277-1.jpg&ehk=TAQjsQIh9s%2bop4%2fujCaUQixSyNwcb0yDa0HilJq1OM0%3d&risl=&pid=ImgRaw&r=0',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set up your account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Easily order the materials you need',
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Choose your role to start ordering your\nart supplies easily at NGU.',
                    style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                  ),
                  SizedBox(height: 24),
                  _buildRoleButton('Student'),
                  SizedBox(height: 12),
                  _buildRoleButton('Doctor/TA'),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: selectedRole.isEmpty
                          ? null
                          : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Select'),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'By continuing you agree to the ',
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(String role) {
    final isSelected = selectedRole == role;
    return GestureDetector(
      onTap: () => setState(() => selectedRole = role),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? Border.all(color: Colors.purple, width: 2) : null,
        ),
        child: Center(
          child: Text(
            role,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.purple : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
