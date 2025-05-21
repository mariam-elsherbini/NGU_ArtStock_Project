import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'loginscreen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGU Palette',
      debugShowCheckedModeBanner: false,
      home: NguPaletteSignup(),
    );
  }
}

class NguPaletteSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.wuzzuf-data.net/files/company_logo/Newgiza-University---NGU-Egypt-20391-1511791065-og.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text('NGU',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic)),
              Text('PALETTE',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white, fontStyle: FontStyle.italic)),
              SizedBox(height: 24),
              _emailButton(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("or use social sign up", style: TextStyle(color: Colors.white)),
              ),
              _socialButton(context, 'Continue with Google', Icons.g_mobiledata),
              _socialButton(context, 'Continue with Microsoft', Icons.desktop_windows),
              _socialButton(context, 'Continue with Apple', Icons.apple),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen2()));
                },
                child: Text('Already have account? Log In', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 14),
          minimumSize: Size(double.infinity, 0),
        ),
        child: Text('Sign up with email'),
      ),
    );
  }

  Widget _socialButtonWithImage(BuildContext context, String text, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 24, height: 24),
            SizedBox(width: 16),
            Text(text, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context, String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.black),
            SizedBox(width: 16),
            Text(text, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
