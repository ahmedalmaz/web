import 'package:ashtar/components/generic_bind.dart';
import 'package:ashtar/cubits/generic_cubit/generic_cubit.dart';
import 'package:ashtar/model/quiz_model.dart';
import 'package:ashtar/screens/dashboard_screen/components/quiz_item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  DatabaseReference database = FirebaseDatabase.instance.ref('Quiz');
  GenericCubit<List<QuizModel>> quizModelCubit =
      GenericCubit<List<QuizModel>>();

  @override
  void initState() {
    // TODO: implement initState
    database.onValue.listen((DatabaseEvent event) {
      List<QuizModel> quizes = [];
      List<dynamic> data = event.snapshot.value as List<dynamic>;
      for (var element in data) {
        quizes.add(
          QuizModel(
              material: element['material'],
              name: element['name'],
              desc: element['desc'],
              date: element['date']),
        );
      }
      quizModelCubit.update(data: quizes);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.spMin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What’s due',
                      style: TextStyle(fontSize: 20.spMin),
                    ),
                    Text(
                      'text to add here ',
                      style: TextStyle(fontSize: 12.spMin),
                    )
                  ],
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 16.spMin, color: Colors.teal),
                    )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            GenericBuilder<List<QuizModel>>(
                genericCubit: quizModelCubit,
                builder: (quizes) {
                  return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                          itemCount: quizes.length,
                          itemBuilder: (context, index) {
                            return QuizItem(
                              quiz: quizes[index],
                            );
                          }));
                })
          ],
        ),
      ),
    );
  }
}
