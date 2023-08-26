import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<DateTime> selectedDates = [
    DateTime(2023, 8, 1),
    DateTime(2023, 8, 2),
    DateTime(2023, 8, 3),
    DateTime(2023, 8, 6),
    DateTime(2023, 8, 7),
    DateTime(2023, 8, 10),
    DateTime(2023, 8, 11),
    DateTime(2023, 8, 12),
    DateTime(2023, 8, 13),
    DateTime(2023, 8, 14),
    DateTime(2023, 8, 18),
    DateTime(2023, 8, 19),
    DateTime(2023, 8, 22),
    DateTime(2023, 8, 24),
    DateTime(2023, 8, 25),
  ];

  bool isSelected(DateTime day) {
    return selectedDates.any((date) => isSameDay(date, day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 40, 40),
      body: TableCalendar(
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          leftChevronIcon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ),
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2040, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSelected(day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);
            if (isSelected(day)) {
              return Container(
                margin: const EdgeInsets.all(4.5),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            } else if (day.isBefore(today)) {
              return Container(
                margin: const EdgeInsets.all(4.5),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(4.5),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
