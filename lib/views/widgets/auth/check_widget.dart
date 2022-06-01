import 'package:flutter/material.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("assets/check.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: const [
            TextUtil(
                text: "I accept",
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none),
            SizedBox(
              width: 3,
            ),
            TextUtil(
                text: "terms & conditions",
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline)
          ],
        )
      ],
    );
  }
}
