import 'package:flutter/material.dart';

class BotRunnerLaunchesList extends StatelessWidget {
  const BotRunnerLaunchesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBotRunnerLaunches('61aa6671ff69b4fa6bd91659'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int idx) {
                var botRunner = snapshot.data.list[idx];
                return ListTile(
                  leading: Text('${idx + 1}'),
                  title: Text('${botRunner.id}'),
                  subtitle: Text('${botRunner.type}'),
                  trailing: Text('${botRunner.status}'),
                  onTap: () {},
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
