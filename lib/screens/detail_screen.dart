import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/data/models/lessons.dart';
import 'package:todo_app/widgets/custButton.dart';

class DetailPage extends StatelessWidget {
  final LessonsItem lesson;
  const DetailPage({super.key, required this.lesson});
  @override
  Widget build(BuildContext context) {
    // -- Linear Progress
    final levelIndicator = LinearProgressIndicator(
        backgroundColor: progressLineBackgroundColor,
        value: lesson.indicatorValue ?? 0.5,
        valueColor: const AlwaysStoppedAnimation(secondaryColor));
    // --- Course Price
    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "\$${lesson.price ?? 0}",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
    // --- Top Content Widgets inside (Icon, Divider, Title, Progress & Title, Price)
    final topContentText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60.0),
        // --- Car Icon (top)
        const Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        // --- Divider
        const SizedBox(
          width: 90.0,
          child: Divider(color: Colors.grey),
        ),
        const SizedBox(height: 10.0),
        // --- Task Title
        Text(
          lesson.title ?? Dictionary.newTask,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 35.0),
        ),
        const SizedBox(height: 20.0),
        // --- Progress & Level & Price
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level ?? Dictionary.lvl,
                      style: const TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    // --- Top Content (Picture, Widgets-(Icon, Divider, Title, Progress & Title, Price)-, Back Button)
    final topContent = Stack(
      children: [
        // --- Picture
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/drive_car.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // --- Widgets
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xE43A4256)),
          child: Center(
            child: topContentText,
          ),
        ),
        // --- Back Button
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
    // --- Bottom Text (Description)
    final bottomContentText = SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Text(
        lesson.content ?? "Content",
        overflow: TextOverflow.fade,
        style: const TextStyle(fontSize: 18.0),
      ),
    );

    // --- Take this Task (Button)
    final readButton = CastButton(text: "TAKE THIS TASK", buttonAction: () {});

    // --- Bottom Content (Text & Button)
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: [bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          topContent,
          bottomContent,
        ],
      ),
    );
  }
}
