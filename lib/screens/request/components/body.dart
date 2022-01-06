import 'package:appointment/screens/request/components/the_banner.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void didChangeDependencies() {
    context.watch<ServiceProvider>().getRequest();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            (context.watch<ServiceProvider>().isNull != true)
                ? Column(
                    children: [
                      ...List.generate(
                          context.watch<ServiceProvider>().data.length,
                          (index) => TheBanner(
                                data: context
                                    .watch<ServiceProvider>()
                                    .data[index],
                              ))
                    ],
                  )
                : Center(child: const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
