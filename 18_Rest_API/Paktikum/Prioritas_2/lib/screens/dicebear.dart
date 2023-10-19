import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prioritas_1/provider/provider.dart';
import 'package:provider/provider.dart';

class DiceBearDisplay extends StatelessWidget {
  const DiceBearDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarProvider = Provider.of<DiceBearProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear Avatar'),
        backgroundColor: const Color.fromARGB(255, 1, 20, 22) ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (avatarProvider.avatarUrl.isNotEmpty)
              SvgPicture.string(
                avatarProvider.avatarUrl,
                width: 350,
                height: 350,
              )
            else
              const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                avatarProvider.fetchAvatar();
              },
              child: const Text('Refresh Avatar'),
             
              
            ),
          ],
        ),
      ),
    );
  }
}
