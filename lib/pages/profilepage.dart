import 'package:flutter/material.dart';
import 'package:food_deliver/pages/loginpage.dart';
import 'package:food_deliver/widgets/shared_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Personal Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change",
                    style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "johndoe123@gmail.com",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text("+91 1234567890", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 5),
                    Text("California, USA", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: SharedButton(
                text: "Change Account",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
