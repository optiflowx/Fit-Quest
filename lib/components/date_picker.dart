// // date_picker.dart
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // For formatting the selected date

// class DatePicker extends StatefulWidget {
//   final Function(String) onDateSelected; // Callback to return the selected date
//   final String label;

//   const DatePicker({super.key, required this.onDateSelected, this.label = 'Select Date'});

//   @override
//   _DatePickerState createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   TextEditingController _dateController = TextEditingController();

//   @override
//   void dispose() {
//     _dateController.dispose();
//     super.dispose();
//   }

//   _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(), // Current date as default
//       firstDate: DateTime(1900), // Earliest date allowed
//       lastDate: DateTime(2100),  // Latest date allowed
//     );

//     if (picked != null) {
//       String formattedDate = DateFormat('MM/dd/yyyy').format(picked); // Format to MM/DD/YYYY
//       setState(() {
//         _dateController.text = formattedDate; // Set the selected date in the TextField
//       });
//       widget.onDateSelected(formattedDate); // Return the date via callback
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _dateController,
//       readOnly: true, // Disable editing, only allow date picker input
//       decoration: InputDecoration(
//         hintText: widget.label,
//         fillColor: Colors.white,
//         filled: true,
//         suffixIcon: Icon(Icons.calendar_today),
//       ),
//       onTap: () {
//         _selectDate(context); // Open the date picker when tapped
//       },
//     );
//   }
// }
