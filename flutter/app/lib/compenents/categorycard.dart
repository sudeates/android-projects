import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image, title;
  final VoidCallback press;
  const CategoryCard({
    super.key,
    required this.image,
    required this.press,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 55,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
