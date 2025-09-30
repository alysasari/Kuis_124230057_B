import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> menuList = const [
    {
      'gameName': "The Witcher 3: Wild Hunt",
      'gameImg': "${Constant.assetsImage}/witcher_3.png",
      'gameDesc':
          "An open-world RPG where you play as Geralt of Rivia, a monster slayer for hire. He embarks on a personal quest to find his adopted daughter Ciri, who is being pursued by the otherworldly Wild Hunt. The game is set in a visually stunning dark fantasy world, offering a rich story and meaningful choices.",
      'gamePublisher' : "CD Projekt",
      'gamePublishDate': "May 19, 2015",
      'totalLike' : 125000,
    },
    {
      'gameName': "Grand Theft Auto V",
      'gameImg': "${Constant.assetsImage}/gta_v.png",
      'gameDesc':
          "An action-adventure game set in the fictional state of San Andreas. Players control three lead protagonists: retired bank robber Michael, street gangster Franklin, and drug dealer Trevor. Their stories interconnect as they commit heists while under pressure from government agencies and powerful criminals.",
      'gamePublisher': "Rockstar Games",
      'gamePublishDate': "September 17, 2013",
      'totalLike': 230000,
    },
    {
      'gameName': "Valorant",
      'gameImg': "${Constant.assetsImage}/valorant.png",
      'gameDesc':
          "A free-to-play tactical first-person shooter developed and published by Riot Games. Two teams of five compete, with one team attacking and the other defending in a series of rounds. Players assume the control of 'Agents,' characters who have unique abilities that enhance the tactical gameplay.",
      'gamePublisher': "Riot Games",
      'gamePublishDate': "June 2, 2020",
      'totalLike' : 180500,
    },
    {
      'gameName': "Genshin Impact",
      'gameImg' : "${Constant.assetsImage}/genshin_impact.png",
      'gameDesc':
          "An action role-playing game featuring an open-world environment and gacha mechanics. Set in the fantasy world of Teyvat, the player controls a traveler searching for their lost twin. Players switch between four characters in a party, using elemental skills to solve puzzles and defeat enemies.",
      'gamePublisher': "miHoYo",
      'gamePublishDate': "September 28, 2020",
      'totalLike': 210000,
    },
    {
      'gameName': "Red Dead Redemption 2",
      'gameImg': "${Constant.assetsImage}/rdr2.png",
      'gameDesc':
          "A Western-themed action-adventure game set in an open world environment. The story follows outlaw Arthur Morgan, a member of the Van der Linde gang, in a fictionalized American Old West in 1899. Arthur must deal with the decline of the Wild West while attempting to survive against rival gangs and other adversaries.",
      'gamePublisher': "Rockstar Games",
      'gamePublishDate': "October 26, 2018",
      'totalLike': 198000,
    },
    {
      'gameName': "Minecraft",
      'gameImg': "${Constant.assetsImage}/minecraft.png",
      'gameDesc':
          "A sandbox video game where players can build and explore virtual worlds made of blocks. There are no specific goals to accomplish, allowing players a large amount of freedom in choosing how to play. Gameplay modes include a survival mode and a creative mode where players have unlimited resources.",
      'gamePublisher': "Mojang Studios",
      'gamePublishDate': "November 18, 2011",
      'totalLike': 350000,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage GameStore, $username"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Sign Out",
            onPressed: () {
              // Setelah sign out arahkan ke LoginPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.75, // lebih proporsional
          ),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            final m = menuList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Gambar menu
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      m['gameImg'],
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            m['gameName'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Text(
                            "${m['gamePublisher']}",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                            ],
                          ),
                          Text(
                            "${m['gamePublishDate']}",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            m['gameDesc'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                           Row(
                             children: [
                               const Icon(
                                 Icons.favorite,
                                 color: Colors.deepPurple,
                                 size: 14,
                               ),
                               const SizedBox(width: 4),
                               Text(
                                 "${m['totalLike']}",
                                 style: const TextStyle(
                                   fontSize: 14,
                                   color: Colors.black54,
                                 ),
                               ),
                             ],
                           ),
                          const Spacer(),
                          
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailPage(
                                      gameName: m['gameName'],
                                      gameImg: m['gameImg'],
                                      gameDesc: m['gameDesc'],
                                      gamePublisher: m['gamePublisher'],
                                      gamePublishDate: m['gamePublishDate'],
                                      totalLike: m['totalLike'],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: const Text("View Details",
                                  style: TextStyle(fontSize: 14,
                                  color: Colors.white
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class   Constant {
  static const String assetsImage = "assets/images";
}
//fixing the code