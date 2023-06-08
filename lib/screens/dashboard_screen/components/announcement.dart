import 'dart:convert';
import 'dart:math';

import 'package:ashtar/components/custom_network_image.dart';
import 'package:ashtar/components/generic_bind.dart';
import 'package:ashtar/cubits/generic_cubit/generic_cubit.dart';
import 'package:ashtar/model/announcement_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  DatabaseReference database = FirebaseDatabase.instance.ref('Announcement');
  GenericCubit<List<AnnouncementModel>> announcementCubit =
      GenericCubit<List<AnnouncementModel>>();
  @override
  void initState() {
    // TODO: implement initState
    database.onValue.listen((DatabaseEvent event) {
      List<AnnouncementModel> announcement = [];
      List<dynamic> data = event.snapshot.value as List<dynamic>;
      for (var element in data) {
        announcement.add(
          AnnouncementModel(
            material: AnnouncementModelMaterial(
                name: element['material']['name'],
                desc: element['material']['desc']),
            teacher: AnnouncementModelTeacher(
                name: element['teacher']['name'],
                material: element['teacher']['material'],
                image: element['teacher']['image']),
          ),
        );
      }
      announcementCubit.update(data: announcement);
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
                      'Announcements',
                      style: TextStyle(fontSize: 25.spMin),
                    ),
                    Text(
                      'text to add here ',
                      style: TextStyle(fontSize: 14.spMin),
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
              height: 10.h,
            ),
            GenericBuilder<List<AnnouncementModel>>(
                genericCubit: announcementCubit,
                builder: (announcements) {
                  return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                          itemCount: announcements.length,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40.h,
                                  height: 40.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(250.r),
                                  ),
                                  child: CustomNetworkImage(
                                    link: announcements[index]
                                        .teacher!
                                        .image
                                        .toString(),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: .07.sw,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        announcements[index]
                                            .teacher!
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14.spMin,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        announcements[index]
                                            .teacher!
                                            .material
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13.spMin, height: 1.5),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: .4.sw,
                                  child: Text(
                                    announcements[index]
                                        .material!
                                        .desc
                                        .toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 12.spMin, color: Colors.grey),
                                  ),
                                )
                              ],
                            );
                          }));
                })
          ],
        ),
      ),
    );
  }
}
