import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_view.dart';
import 'state/dashboard_cubit.dart';
import 'state/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()..init(),
      child: BlocListener<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        child: const DashboardView(),
      ),
    );
  }
}

// PlanCard Widget for displaying individual plans inside a container
// class PlanCard extends StatelessWidget {
//   final String title;
//   final String duration;
//   final Color color;
//   final IconData icon;
//   final VoidCallback onTap;

//   const PlanCard({
//     super.key,
//     required this.title,
//     required this.duration,
//     required this.color,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// ActionButtonCard for the "Let’s Go" button
// class ActionButtonCard extends StatelessWidget {
//   final String title;
//   final Color color;

//   const ActionButtonCard({
//     super.key,
//     required this.title,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
