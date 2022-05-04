import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rpa_monitor/controllers/electroneek_controller.dart';

class BotRunnersUI extends StatelessWidget {
  final ElectroNeekController _electroneekController = ElectroNeekController.to;

  BotRunnersUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1))
            .asyncMap((event) => _electroneekController.fetchBotRunners()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int index) {
                var botRunner = snapshot.data!.list[index];
                Color statusColor = Colors.grey;
                if (botRunner.status == 'ready') {
                  statusColor = Colors.green;
                } else if (botRunner.status == 'in_progress') {
                  statusColor = Colors.yellow;
                } else if (botRunner.status == 'offline') {
                  statusColor = Colors.red;
                }
                return Badge(
                  badgeColor: statusColor,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${botRunner.name}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                '${botRunner.hostName}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                '${botRunner.id}',
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Container(
                                  child:
                                      const Icon(LineIcons.robot, size: 36.0),
                                ),
                              ),
                              Text(
                                'Версия: ${botRunner.version}',
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('${botRunner.id}');
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
        });
  }
}
