import 'package:conter_app/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterApp",
          style: TextStyle(color: context.read<CounterCubit>().color),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(context
                    .read<CounterCubit>()
                    .value
                    .toString(),
                  style: TextStyle(fontSize: 30,
                    color: context.read<CounterCubit>().color,
                  ),
                );
              },
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().Zero();
            },
                child: Text("0",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            SizedBox(height: 15,),

            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().InecrementOne();
            },
                child: Text("+1",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().DenecrementOne();
            },
                child: Text("-1",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().InecrementTen();
            },
                child: Text("+10",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().DenecrementTen();
            },
                child: Text("-10",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),

          ],
        ),
      ),

    );
  }
}
