import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpa_monitor/controllers/electroneek_controller.dart';

class WorkflowsUI extends StatelessWidget {
  final ElectroNeekController _electroneekController = ElectroNeekController.to;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 5))
            .asyncMap((event) => _electroneekController.fetchWorkflowsList()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int index) {
                var workflow = snapshot.data!.list[index];
                return Stack(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 5.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 176.0,
                        height: 256.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${workflow.name}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              '${workflow.description}',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      bottom: 20.0,
                      child: FutureBuilder(
                        future: _electroneekController.fetchWorkflowLaunches(workflow.id),
                        builder: (BuildContext context, AsyncSnapshot snap) {
                          if (snap.hasData) {
                            var workflowLaunch = snap.data;
                            Color launcheColor = Colors.grey;
                            if (workflowLaunch.status == 'in-progress') {
                              launcheColor = Colors.yellow;
                            } else if (workflowLaunch.status == 'completed-successfully') {
                              launcheColor = Colors.green;
                            } else if (workflowLaunch.status == 'completed-with-error') {
                              launcheColor = Colors.red;
                            } else if (workflowLaunch.status == 'forced-stop') {
                              launcheColor = Colors.purple;
                            }
                            return Container(
                              width: 148.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: launcheColor,
                              ),
                            );
                          }
                          return Container(
                            width: 148.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
                  Badge(
                  badgeColor: Colors.transparent,
                  position: BadgePosition.bottomEnd(bottom: 16.0, end: 16.0),
                  child: GestureDetector(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 5.0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${workflow.name}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                '${workflow.description}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: FutureBuilder(
                            future: _electroneekController.fetchWorkflowLaunchesLastTenMinutes(workflow.id),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  padding: EdgeInsets.all(4.0),
                                  itemCount: snapshot.data!.list.length,
                                  itemBuilder: (BuildContext context, int idx) {
                                    var workflowLaunch = snapshot.data.list[idx];
                                    Color launcheColor = Colors.grey;
                                    if (workflowLaunch.status == 'in-progress') {
                                      launcheColor = Colors.yellow;
                                    } else if (workflowLaunch.status == 'completed-successfully') {
                                      launcheColor = Colors.green;
                                    } else if (workflowLaunch.status == 'completed-with-error') {
                                      launcheColor = Colors.red;
                                    } else if (workflowLaunch.status == 'forced-stop') {
                                      launcheColor = Colors.purple;
                                    }
                                    return Card(
                                      child: ListTile(
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Время запуска: ${workflowLaunch.startedAt}', style: TextStyle(fontSize: 12.0)),
                                            Text('Время завершения: ${workflowLaunch.completedAt}', style: TextStyle(fontSize: 12.0)),
                                          ],
                                        ),
                                        trailing: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6.0),
                                            color: launcheColor,
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const Center(child: CircularProgressIndicator());
                            }
                          ),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }
}
