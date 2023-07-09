// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalenderView extends StatefulWidget {
//   const CalenderView({super.key});

//   @override
//   State<CalenderView> createState() => _CalenderViewState();
// }

// class _CalenderViewState extends State<CalenderView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TableCalendar(
//                 firstDay: DateTime.utc(2010, 10, 16),
//                 lastDay: DateTime.utc(2030, 3, 14),
//                 focusedDay: DateTime.now(),
//                 calendarStyle: CalendarStyle(
//                   todayDecoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.amber,
//                   ),
//                   canMarkersOverflow: true,
//                   todayTextStyle: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       color: Colors.white),
//                   selectedTextStyle:
//                       TextStyle(color: Theme.of(context).primaryColor),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () async {
//                     // final DateTimeRange? dateTimeRange = await showDateRangePicker(
//                     //   context: context,
//                     //   firstDate: DateTime(2000),
//                     //   lastDate: DateTime(3000),

//                     // );
//                     var dd = showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(3000),
//                     );
//                   },
//                   child: const Text("Date Picker Range")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//===================================================================================================

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class DynamicEvent extends StatefulWidget {
  const DynamicEvent({super.key});

  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text('Flutter Dynamic Event Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              // eventLoader: _events,
              // initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                canMarkersOverflow: true,
                todayTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
                selectedTextStyle:
                    TextStyle(color: Theme.of(context).primaryColor),
              ),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              // selectedDayPredicate: (day) {
              //
              // },
              // onDaySelected: (date, events,holidays) {
              //   setState(() {
              //     _selectedEvents = events;
              //   });
              // },
              // builders: CalendarBuilders(
              //   selectedDayBuilder: (context, date, events) => Container(
              //       margin: const EdgeInsets.all(4.0),
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           color: Theme.of(context).primaryColor,
              //           borderRadius: BorderRadius.circular(10.0)),
              //       child: Text(
              //         date.day.toString(),
              //         style: const TextStyle(color: Colors.white),
              //       )),
              //   todayDayBuilder: (context, date, events) => Container(
              //       margin: const EdgeInsets.all(4.0),
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           color: Colors.orange,
              //           borderRadius: BorderRadius.circular(10.0)),
              //       child: Text(
              //         date.day.toString(),
              //         style: const TextStyle(color: Colors.white),
              //       )),
              // ),
              // calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      event,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white70,
              title: const Text("Add Events"),
              content: TextField(
                controller: _eventController,
              ),
              actions: const <Widget>[
                // FlatButton(
                //   child: const Text("Save",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                //   onPressed: () {
                //     if (_eventController.text.isEmpty) return;
                //     setState(() {
                //       if (_events[_controller.selectedDay] != null) {
                //         _events[_controller.selectedDay]
                //             .add(_eventController.text);
                //       } else {
                //         _events[_controller.selectedDay] = [
                //           _eventController.text
                //         ];
                //       }
                //       prefs.setString("events", json.encode(encodeMap(_events)));
                //       _eventController.clear();
                //       Navigator.pop(context);
                //     });

                //   },
                // )
              ],
            ));
  }
}
