import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../login_screen.dart';

class FilterScreen extends StatefulWidget {
  final DateTime? selectedDay;

  const FilterScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay ?? _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Filter",
        onBackClick: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              "Select Date",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.only(bottom: 24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black,
              ),
              child: TableCalendar(
                firstDay: DateTime(1995),
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                headerStyle: HeaderStyle(
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonVisible: false,
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  titleCentered: true,
                ),
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
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
                daysOfWeekHeight: 40,
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isWeekend(day)
                            ? Theme.of(context).primaryColor
                            : null,
                        border: Border.all(
                          width: 2,
                          color: _isWeekend(day)
                              ? Theme.of(context).primaryColor
                              : const Color(0xff727272),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat("EEE").format(day)[0],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  disabledBuilder: (context, day, focusedDay) {
                    return Text(
                      "${day.day}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 86, 86, 86),
                        fontSize: 16.0,
                      ),
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    return Text(
                      "${day.day}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 135, 135, 135),
                        fontSize: 16.0,
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Text(
                      "${day.day}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Text(
                      "${day.day}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(_selectedDay);
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isWeekend(
  DateTime day, {
  List<int> weekendDays = const [DateTime.saturday, DateTime.sunday],
}) {
  return weekendDays.contains(day.weekday);
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 3, kToday.month, kToday.day);
