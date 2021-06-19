import 'package:flutter/material.dart';
import 'package:mini_project/models/user.dart';

class MatchList extends StatefulWidget {
  final List<User> matchList;

  MatchList(this.matchList);

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget icon(int index){
      return widget.matchList[index].isSuperLiked ? IconButton(
        icon: Icon(Icons.thumb_up,
          color:Colors.red ,
          size: 32,
        ),
        onPressed: (){
          setState(() {
            widget.matchList[index].isSuperLiked = ! widget.matchList[index].isSuperLiked;
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
            widget.matchList[index].isSuperLiked = ! widget.matchList[index].isSuperLiked;
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[400]
        ),
        title: Text(
          "Match List",
          style: TextStyle(
              color: Colors.red[400],
              fontSize: 28.0
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 12.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: widget.matchList.length,
          itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: Material(
              elevation: 14.0,
              borderRadius: BorderRadius.circular(12.0),
              shadowColor: Color(0x802196F3),
              child: Container(
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
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.matchList[index].img),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 200,
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
                                    widget.matchList[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.matchList[index].age.toString(),
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
            ),
          );
        }),
      ),
    );
  }
}

