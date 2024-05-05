import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Counter"),

      ),
      backgroundColor: Colors.white,
      body:Column(
        children: [
          Text("TEAM A",
          style: (TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          )),
          ),
          SizedBox(height: 30,),
          Text("0",
            style: (TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            )),
          ),
          ElevatedButton(onPressed: () {
           // context.read<CounterCubit>().Zero();
          },
              child: Text("0",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(height: 15,),

          ElevatedButton(onPressed: () {
           // context.read<CounterCubit>().InecrementOne();
          },
              child: Text("+1",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () {
            //context.read<CounterCubit>().DenecrementOne();
          },
              child: Text("-1",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () {
            //context.read<CounterCubit>().InecrementTen();
          },
              child: Text("+10",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () {
            //context.read<CounterCubit>().DenecrementTen();
          },
              child: Text("-10",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),

        ],
      ) ,
    );
  }
}
