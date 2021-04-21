import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget extends StatelessWidget {
  final String? task;
  final Color? colour;
  final String? time;

  const SlidableWidget({
    Key, key,
    @required this.task,
    @required this.colour,
    @required this.time
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 120.0,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0,9),
              blurRadius: 20,
              spreadRadius: 1
          )]
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: colour!, width: 4.0),
              ),
            ),
            /* We wrap the below Column in a Flexible widget to
            * prevent text overflow */
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                      height: 4.0
                  ),
                  Text(
                    time!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 80,
              width: 4.0,
              color: colour,
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: colour,
          icon: Icons.edit,
          onTap: (){},
        ),
        IconSlideAction(
          caption: "Delete",
          color: colour,
          icon: Icons.delete,
          onTap: (){},
        )
      ],
    );
  }
}
