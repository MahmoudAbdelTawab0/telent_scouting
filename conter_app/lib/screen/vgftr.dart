import 'package:conter_app/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Score Counter",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TEAM A",
                    style: TextStyle(fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30,),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(context
                          .read<CounterCubit>()
                          .value
                          .toString(),
                        style: TextStyle(fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: () {
                    context.read<CounterCubit>().InecrementOne();
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width, // width
                              57 // height
                          )),
                      child: Text("+1 POINT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(height: 15,),

                  ElevatedButton(onPressed: () {
                    context.read<CounterCubit>().InecrementTen();
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width, // width
                              57 // height
                          )),
                      child: Text("+2 POINT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: () {
                    context.read<CounterCubit>().DenecrementTen();
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width, // width
                              57 // height
                          )),
                      child: Text("+3 POINT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),

                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}