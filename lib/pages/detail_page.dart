import 'package:flutter/material.dart';



class DetailPage extends StatefulWidget {
  final String gameName;
  final String gameImg;
  final String gameDesc;
  final String gamePublisher;
  final String gamePublishDate;
  final int totalLike;

  const DetailPage({
    super.key,
    required this.gameName,
    required this.gameImg,
    required this.gameDesc,
    required this.gamePublisher,
    required this.gamePublishDate,
    required this.totalLike,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int totalLike;
  get mainAxisAlignment => MainAxisAlignment.spaceBetween;

  @override
  void initState() {
    super.initState();
    totalLike = widget.totalLike;
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: Colors.deepPurple,
         
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Gambar sesuai menu
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.gameImg, // gunakan gameImg dari DetailPage
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.gameName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.gamePublisher,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  widget.gamePublishDate,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.deepPurple,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      totalLike++;
                    });
                  },
                ),
                Text(
                  "$totalLike",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),

           Text(
              widget.gameDesc,
              style: const TextStyle(fontSize: 16),
            ),  


           
            const SizedBox(height: 20),
           
        
           
          
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
