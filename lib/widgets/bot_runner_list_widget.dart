import 'package:flutter/material.dart';

class BotRunnersList extends StatelessWidget {
  const BotRunnersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.fromFuture(getBotRunners()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int idx) {
                var botRunner = snapshot.data.list[idx];
                return ListTile(
                  leading: Text('${idx + 1}'),
                  title: Text('${botRunner.name}'),
                  subtitle: Text('${botRunner.id}'),
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
    // return FutureBuilder(
    //     future: getBotRunners(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: snapshot.data!.list.length,
    //           itemBuilder: (BuildContext context, int idx) {
    //             var botRunner = snapshot.data.list[idx];
    //             return ListTile(
    //               leading: Text('${idx + 1}'),
    //               title: Text('${botRunner.name}'),
    //               subtitle: Text('${botRunner.id}'),
    //               trailing: Text('${botRunner.status}'),
    //               onTap: () {},
    //             );
    //           },
    //         );
    //       } else if (snapshot.hasError) {
    //         return Text('${snapshot.error}');
    //       }
    //       return const CircularProgressIndicator();
    //     });
  }
}
