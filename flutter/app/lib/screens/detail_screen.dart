import 'package:app/model/place_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final PlaceInfo placeInfo;

  const DetailScreen({super.key, required this.placeInfo});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              widget.placeInfo.image,
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(
                                Icons.arrow_back,
                                color: Colors.blue,
                                size: 20,
                              )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Center(
                                child: Icon(
                              Icons.bookmark_rounded,
                              color: Colors.blue,
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Expanded(
                  child: Container(
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeInfo.name,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    widget.placeInfo.location,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Place Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.placeInfo.desc,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              const Divider(
                                height: 5,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              
                              Row(
                                children: [
                                  const Text(
                                "Distance:",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),),
                                  Text(
                                "${widget.placeInfo.distance} km",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              MaterialButton(
                                color: Colors.blue,
                                minWidth: double.infinity,
                                height: 55,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                onPressed: (){
                                
                                } ,
                                child: const Text("Book Reservation",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                ),
                                const SizedBox(height: 20,),
                            ],
                          ),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
