import 'package:flutter/material.dart';
import 'package:geo_pulse/Frontend/Components/Date_Input.dart';
import 'package:geo_pulse/Frontend/Components/Time_Input.dart';



class CheckinForm extends StatefulWidget {
  final VoidCallback onSubmit;
  const CheckinForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<CheckinForm> createState() => _CheckinFormState();
}

class _CheckinFormState extends State<CheckinForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chekin form"),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
          ),
        child: Column(
          children: [
            DateInputField(),
            SizedBox(
              height: 20,
            ),
            TimeInputField(title: 'Select Checkin Time',),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
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
              height: 30,
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