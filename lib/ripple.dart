import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rippling extends StatelessWidget {
  Rippling({super.key});

  var flag = false.obs;

  @override
  Widget build(BuildContext context) {
    var size = Get.size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Obx(() => Stack(
                      alignment: Alignment.center,
                      children: [

                        AnimatedPositioned(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          top: flag.value ? 16 + size.width * .22 : 21,
                          left: flag.value ? size.width * .5 - 40 : 21,
                          child: GestureDetector(
                            onTap: () => flag.value = true,
                            child: Text(
                              flag.value ? "Ripples" : "Expand",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),


                        // First container (large)
                        AnimatedContainer(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          width: flag.value ? size.width * .85 : size.width * .55,
                          height: flag.value ? size.width * .85 : size.width * .55,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(flag.value ? 70 : 1000),
                          ),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 333),
                            opacity: flag.value ? 1 : 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(child: Icon(Icons.shopping_cart, color: Colors.white,), alignment: PlaceholderAlignment.middle),
                                        TextSpan(
                                          text: "  items in cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.width * .045,
                                            fontWeight: FontWeight.w900,
                                          )
                                        )
                                      ]
                                    )
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(21.0),
                                  child: Text.rich(
                                      TextSpan(
                                          children: [
                                            WidgetSpan(child: Icon(Icons.history_toggle_off, color: Colors.white,), alignment: PlaceholderAlignment.middle),
                                            TextSpan(
                                                text: "  purchase history",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: size.width * .045,
                                                  fontWeight: FontWeight.w900,
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                ),

                                Text.rich(
                                    TextSpan(
                                        children: [
                                          WidgetSpan(child: Icon(Icons.settings, color: Colors.white,), alignment: PlaceholderAlignment.middle),
                                          TextSpan(
                                              text: "  app setting",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * .045,
                                                fontWeight: FontWeight.w900,
                                              )
                                          )
                                        ]
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),


                        // Second container (medium)
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          bottom: flag.value ? 42 : size.height * .5 - size.width * .47 * .5,
                          right: flag.value ? 21 : size.width * .5 - size.width * .47 * .5,

                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 555),
                            curve: Curves.ease,
                            width: flag.value ? size.width * .22 : size.width * .47,
                            height: flag.value ? size.width * .22 : size.width * .47,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: GestureDetector(
                                onTap: () => flag.value = false,
                                child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 333),
                                    opacity: flag.value ? 1 : 0,
                                    child: Icon(Icons.autorenew_rounded, color: Colors.white70, size: 40,))),
                          ),
                        ),


                        // Third container (small)
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 555),
                          curve: Curves.ease,
                          top: flag.value ? 21 : size.height * .5 - size.width * .38 * .5,

                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 555),
                            curve: Curves.ease,
                            width: flag.value ? size.width * .18 : size.width * .38,
                            height: flag.value ? size.width * .18 : size.width * .38,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
