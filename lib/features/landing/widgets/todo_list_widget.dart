import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("todos").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (context, index) {
                final temp = snapshot.data?.docs[index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          log("Subarna");
                        },
                        backgroundColor: Colors.grey.shade50,
                        foregroundColor: temp!['isDone'] == false
                            ? Colors.green
                            : Colors.black87,
                        icon: temp['isDone'] == false ? Icons.check : null,
                        label: temp['isDone'] == false
                            ? 'Mark as complete'
                            : 'Mark as incomplete',
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: todoListColors[temp['color'] - 1],
                    ),
                    child: ListTile(
                      leading: temp['isDone'] == true
                          ? Icon(
                              Icons.check_box,
                              color: todoListColors[temp['color'] - 1]
                                  .withGreen(500),
                              // color: Colors.black,
                            )
                          : null,
                      minLeadingWidth: 30,
                      title: Text(
                        "${temp['title']}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const VerticalSpace(height: 5);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
