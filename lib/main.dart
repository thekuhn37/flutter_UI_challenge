import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          '/Users/harry.d.hwang/projects/ui_challenge/imgs/harry_self.JPG'),
                    ),
                    Icon(
                      Icons.add,
                      size: 40,
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DayOfWeek(),
              ),
              const SizedBox(
                height: 1,
              ),
              Transform.translate(
                offset: const Offset(20, 0),
                child: const Row(
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      ' · ',
                      style: TextStyle(
                        color: Color.fromRGBO(178, 33, 131, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '17  18  19  2',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const ScheduleCard(
                bgColor: Color.fromRGBO(254, 248, 84, 1),
                title1: 'Design',
                title2: 'Meeting',
                startHour: 11,
                startMin: 30,
                finishHour: 12,
                finishMin: 20,
                members: ['Aex', 'Helena', 'Nana'],
              ),
              const ScheduleCard(
                bgColor: Color.fromRGBO(156, 107, 206, 1),
                title1: 'Daily',
                title2: 'Project',
                startHour: 12,
                startMin: 35,
                finishHour: 14,
                finishMin: 10,
                members: [
                  'Me',
                  'Richard',
                  'Ciry',
                  'Tom',
                  'Jim',
                  'Kelvin',
                  'Ted'
                ],
              ),
              const ScheduleCard(
                bgColor: Color.fromRGBO(190, 238, 77, 1),
                title1: 'Weekly',
                title2: 'Planning',
                startHour: 15,
                startMin: 00,
                finishHour: 16,
                finishMin: 30,
                members: [
                  'Den',
                  'Nana',
                  'Mark',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Color.fromRGBO(254, 248, 84, 1)

class ScheduleCard extends StatelessWidget {
  final Color bgColor;
  final String title1, title2;
  final int startHour, startMin, finishHour, finishMin;
  final List<String> members;

  const ScheduleCard({
    super.key,
    required this.bgColor,
    required this.title1,
    required this.title2,
    required this.startHour,
    required this.startMin,
    required this.finishHour,
    required this.finishMin,
    required this.members,
  });

  String displayMembers() {
    if (members.length <= 3) {
      // If the length is 3 or fewer, display all members in a row
      return (members.join('    ').toUpperCase());
    } else {
      // If the length is greater than 3, display the first 3 members
      // and append '+ rest number' at the end
      return ('${members.sublist(0, 3).join('    ').toUpperCase()}     +${members.length - 3}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '$startHour',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -5),
                        child: Text(
                          '$startMin',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Text('ㅣ'),
                      Text(
                        '$finishHour',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -5),
                        child: Text(
                          '$finishMin',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 10),
                        child: Text(
                          title1.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -15),
                        child: Text(
                          title2.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 48,
                    ),
                    Transform.translate(
                      offset: const Offset(0, 0),
                      child: Text(
                        displayMembers(),
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayOfWeek extends StatelessWidget {
  const DayOfWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    String dayOfWeek = DateFormat('EEEE').format(today);
    int day = today.day;

    return Row(
      children: [
        Text(
          dayOfWeek.toUpperCase(),
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$day',
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
