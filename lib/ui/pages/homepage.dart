import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/core/enums/apptypes.dart';
import 'package:todoapp/widgets/slideablewidget.dart';

import '../styles.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilterType filterType = FilterType.today;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text("Work List", style: TextStyle(
                  fontSize: 30
                ),),
                actions: [
                  IconButton(
                      icon: Icon(
                          Icons.short_text,
                      color: Colors.white,
                      size: 30,),
                      onPressed: (){}
                  )
                ],
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => onFilterChange(FilterType.today),
                          child: Text("Today", style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 4,
                          width: 120,
                          color: filterType == FilterType.today ? highlightColour : notSelectedColour,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => onFilterChange(FilterType.monthly),
                          child: Text("Monthly", style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 4,
                          width: 120,
                          color: filterType == FilterType.monthly ? highlightColour : notSelectedColour,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              filterType == FilterType.monthly ?
              getCalendar():
              Container(),
              SizedBox(
                  height: 10.0
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_focusedDay.day} ${getMonths()[_focusedDay.month - 1]}, ${_focusedDay.year}",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0
                        ),
                        /* 80 max text length */
                        SlidableWidget(colour: Colors.blue, task: "Team meeting(remember to bring notes!)" , time: "10:00 AM"),
                        SlidableWidget(colour: Colors.green, task: "Remember to pick up dry cleaning" , time: "12:00 PM"),
                        SlidableWidget(colour: Colors.purple, task: "This is just a representation of a really, really long line of text to see what" , time: "2:00 PM"),
                        SlidableWidget(colour: Color(0xfff96060), task: "Pick up some bread on way home" , time: "5:00 PM")
                      ],
                    ),
                  ),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                        child: Container(
                          height: 90.0,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xff292e4e),
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text("My Task", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0
                                    ),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text("Menu", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0
                                    ),)
                                  ],
                                ),
                              ),
                              Container(width: getSpacerWidth(MediaQuery.of(context).size.width)),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.wysiwyg_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text("Projects", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0
                                    ),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.account_circle_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text("Account", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0
                                    ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                    ),
                    Positioned(
                        bottom: 25.0,
                      left: 0,
                      right:0,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xfff96060),
                                Colors.red
                              ]
                            ),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Text("+",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 30% of width
  double getSpacerWidth(double width) => (0.3 * width);

  onFilterChange(FilterType target){
    //  we only need to act if target is !=
    //  currently selected target type
    if(filterType != target)
      {
        setState(() {
          filterType = target;
        });
      }
  }

  TableCalendar getCalendar(){
    return TableCalendar(
      firstDay: DateTime.utc(2020, 01, 01),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day){
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.
        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }

}
