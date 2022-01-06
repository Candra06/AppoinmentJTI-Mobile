import 'package:appointment/service/sercive_provider.dart';
import 'package:appointment/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  final String product;
  final String id;

  const Body({Key? key, required this.product, required this.id})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _item;
  @override
  void didChangeDependencies() {
    _item = context.watch<ServiceProvider>().listChat(id: widget.product);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _item.whenComplete(
          () => Positioned(
            top: 0,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: ListChat(
              data: context.watch<ServiceProvider>().data,
            ),
          ),
        ),
        _item.onError(
          (ex, stackTrace) => Positioned(
            top: 0,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Center(
              child: Text(""),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenWidth! / 4.5,
          child: Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              onChanged: (value) {},
              onSubmitted: (value) => context
                  .watch<ServiceProvider>()
                  .postChat(id: widget.product, message: value),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Apa yang anda pikirkan",
                // prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_outlined)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListChat extends StatelessWidget {
  ListChat({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return (context.watch<ServiceProvider>().isNull == true)
            ? Container(
                color: Colors.amber,
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                            child: Text(
                          data[index]['message'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        )),
                        SizedBox(width: getProportionateScreenWidth(25)),
                        Text(
                          data[index]['update_time'],
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Center(child: const CircularProgressIndicator());
      },
    );
  }
}
