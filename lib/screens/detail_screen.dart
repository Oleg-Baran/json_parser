import 'package:flutter/material.dart';
import 'package:todo_app/models/lessons.dart';

class DetailPage extends StatelessWidget {
  final LessonsItem lesson;
  const DetailPage({super.key, required this.lesson});
  @override
  Widget build(BuildContext context) {
    final levelIndicator = LinearProgressIndicator(
        backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
        value: lesson.indicatorValue,
        valueColor: const AlwaysStoppedAnimation(Colors.amber));

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "\$${lesson.price}",
        style: const TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 120.0),
        const Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        const SizedBox(
          width: 90.0,
          child: Divider(color: Colors.grey),
        ),
        const SizedBox(height: 10.0),
        Text(
          lesson.title ?? "Title",
          style: const TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        const SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level ?? "Level",
                      style: const TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drive_car.jpg'),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
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

    final bottomContentText = SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Text(
        lesson.content ?? "Content",
        overflow: TextOverflow.fade,
        style: const TextStyle(fontSize: 18.0),
      ),
    );

    final readButton = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => {},
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(58, 66, 86, 1))),
          child: const Text("TAKE THIS LESSON",
              style: TextStyle(color: Colors.white)),
        ));

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
