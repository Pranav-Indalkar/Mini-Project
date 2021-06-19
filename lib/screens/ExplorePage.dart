import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/screens/MatchList.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<User> profiles = [
    User('assets/img_1.jpeg', "Cathy", 26),
    User('assets/img_2.jpeg', "Mia", 24),
    User('assets/img_3.jpeg', "Ariana", 31),
    User('assets/img_4.jpeg', "Beth", 30),
    User('assets/img_5.jpeg', "Lily", 28),
    User('assets/img_6.jpeg', "Elizabeth", 22),
    User('assets/img_7.jpeg', "Lana", 29),
    User('assets/img_8.jpeg', "Shilpa", 23),
    User('assets/img_9.jpeg', "Dawn", 26),
    User('assets/img_10.jpeg', "Sophia", 27),
    User('assets/img_11.jpeg', "Emily", 28),
  ];
  List<User> matchList = [];

  Widget icon(int index){
    return profiles[index].isSuperLiked ? IconButton(
      icon: Icon(Icons.thumb_up,
        color:Colors.red ,
        size: 32,
      ),
      onPressed: (){
        setState(() {
          profiles[index].isSuperLiked = ! profiles[index].isSuperLiked;
        });
      },
    ) :
    IconButton(
      icon: Icon(Icons.thumb_up,
        color:Colors.white70 ,
        size: 32,
      ),
      onPressed: (){
        setState(() {
          profiles[index].isSuperLiked = ! profiles[index].isSuperLiked;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              "Abyow",
            style: TextStyle(
              color: Colors.red[400],
              fontSize: 28.0
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 12.0,
          actions: [
            IconButton(
              icon: Icon(Icons.thumbs_up_down,color: Colors.red[400],),
              iconSize: 28,
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MatchList(matchList)));
              },
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5,20,5,120),
          child: Container(
            child: TinderSwapCard(
              maxHeight: size.height,
              maxWidth: size.width,
              minHeight: size.height * 0.75,
              minWidth: size.width * 0.75,
              totalNum: profiles.length,
              cardBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(children: [
                      Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(profiles[index].img),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.25),
                                  Colors.black.withOpacity(0),
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text(
                                    profiles[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    profiles[index].age.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: icon(index)
                              ),
                            ],
                          )
                        ],
                      )
                    ])),
              ),
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index){
                if(orientation == CardSwipeOrientation.RIGHT){
                  matchList.add(profiles[index]);
                }
              },
            ),
          ),
        ));
  }
}
