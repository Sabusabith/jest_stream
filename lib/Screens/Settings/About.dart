import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Jetstream",
            style: TextStyle(
                color: Colors.grey.shade300, fontSize: 21, letterSpacing: 2),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to Jetstream! We are a new and exciting streaming platform that offers a vast selection of movies, TV shows, and original content for you to enjoy. Our team is dedicated to providing an intuitive and seamless streaming experience for all users. With a simple and intuitive interface, you can easily find and watch your favourite content in just a few clicks. We are constantly updating and expanding our library, so there is always something new to discover. We also offer personalized recommendations based on your viewing history, so you can easily find new and exciting content to enjoy. Thank you for choosing Jetstream for all of your entertainment needs. We hope you have a great time streaming!",
            style: TextStyle(color: Colors.grey.shade400),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.shade500,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Application Version",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "JSV 1.0.1",
            style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          )
        ],
      ),
    );
  }
}
