import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/pages/home_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.purpleAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/img/user.png"
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Suteki",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    "suteki@gmail.com",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    listProfile(Icons.person, "Full Name", "Suteki Kurniawan"),
                    listProfile(Icons.email, "Email", "suteki@gmail.com"),
                    listProfile(Icons.male, "Gender", "male"),
                    listProfile(Icons.phone, "Phone Number", "081288930012"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}