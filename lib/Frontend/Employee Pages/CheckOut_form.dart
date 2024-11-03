import 'package:flutter/material.dart';
import 'package:geo_pulse/Frontend/Components/Date_Input.dart';
import 'package:geo_pulse/Frontend/Components/Time_Input.dart';


class CheckOut extends StatefulWidget {
  final VoidCallback onSubmit;
  const CheckOut({super.key,
  required this.onSubmit});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut form"),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 11.0,
          ),
        child: Column(
          children: [
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            DateInputField(),
            SizedBox(
              height: 8,
            ),
            TimeInputField(title: 'Select CheckOut Time',),
            SizedBox(
              height: 8,
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            
            Row(
              children: [Expanded(child: Container()),
                ElevatedButton(
                  style: ButtonStyle(
                    
                  ),
                  onPressed: (){}, 
                  child: Text("Get Location")),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: MaterialButton(
                onPressed: widget.onSubmit, 
                child: Text('Submit',style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            )
          ],
        ),
      ) ,
    );
  }
}