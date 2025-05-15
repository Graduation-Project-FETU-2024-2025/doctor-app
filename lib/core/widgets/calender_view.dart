import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

// calendar_view: ^1.4.0

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  final EventController _eventController = EventController();

  // @override
  // void initState() {
  //   super.initState();
    // _eventController.addAll([
    //   CalendarEventData(
    //     title: "Orange Event",
    //     date: DateTime(2023, 10, 12),
    //     color: Colors.orange,
    //   ),
    //   CalendarEventData(
    //     title: "Blue Event",
    //     date: DateTime(2023, 10, 20),
    //     color: Colors.blue,
    //   ),
    //   CalendarEventData(
    //     title: "Red Event",
    //     date: DateTime(2023, 11, 14),
    //     color: Colors.red,
    //   ),
    // ]); 

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: MonthView(
    controller: _eventController,
    initialMonth: DateTime.now(),
    cellBuilder: (date, events, isToday, isSelected, isWeekend) {

      bool hasEvent = events.isNotEmpty;

      return Container(
        decoration: BoxDecoration(
          // نبقى نغيرها لون مختلف لكل بوردر كده
          border: hasEvent
              ? Border.all(color: Colors.green, width: 2)  // اللون الأخضر إذا في حدث
              : null,
          color: isToday ? Colors.blue.shade100 : Colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: isWeekend ? Colors.red : Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    },
    cellAspectRatio: 1.5, // دى نغير حجم المربعات
    onCellTap: (events, date) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EventDetailsScreen(
            selectedDate: date,
            eventController: _eventController,
          ),
        ),
      );
    },
    weekDayBuilder: (int index) {
      // دى ايام الاسبوع نكتبها ب اى شكل عشان موضوع الترجمه
      const days = ['السبت', 'الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة'];
      return Center(
        child: Text(
          days[index],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    },
    
    // تخصيص عنوان الشهر في الـ header  ال هى فوق ايام الاسبوع 
    headerBuilder: (DateTime date) {
      return Center(
        child: Text(
          '${date.month} / ${date.year}', // يمكن تغيير التنسيق حسب الرغبة
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    },

    // انيميشن واحنا بنتنقل بين الشهور 
    pageTransitionDuration: const Duration(milliseconds: 300),
    pageTransitionCurve: Curves.easeInOut,
  
  ),
)
;

  }
}


// دى الصفحه ال هنضيف فيها ايفينت جديد تمام 

class EventDetailsScreen extends StatefulWidget {
  final DateTime selectedDate;
  final EventController eventController;

  const EventDetailsScreen({
    required this.selectedDate,
    required this.eventController,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final TextEditingController _eventTitleController = TextEditingController();

  List<CalendarEventData> get _eventsForDate {
    return widget.eventController.events
        .where((e) =>
            e.date.year == widget.selectedDate.year &&
            e.date.month == widget.selectedDate.month &&
            e.date.day == widget.selectedDate.day)
        .toList();
  }

  void _addEvent() {
    final title = _eventTitleController.text.trim();
    if (title.isEmpty) return;

    final newEvent = CalendarEventData(
      title: title,
      date: widget.selectedDate,
      color: Colors.purple, 
    );

    widget.eventController.add(newEvent);
    _eventTitleController.clear();
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events on ${widget.selectedDate.day}/${widget.selectedDate.month}"),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _eventTitleController,
              decoration: InputDecoration(
                labelText: "Event Title",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addEvent,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Previous Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Expanded(
              child: _eventsForDate.isEmpty
                  ? Center(child: Text("No events yet"))
                  : ListView.builder(
                      itemCount: _eventsForDate.length,
                      itemBuilder: (context, index) {
                        final event = _eventsForDate[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: event.color,
                          ),
                          title: Text(event.title),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
