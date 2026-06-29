// // lib/screens/booking/ticket_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';

// class TicketScreen extends StatelessWidget {
//   final Map<String, dynamic> bookingDetails;

//   const TicketScreen({Key? key, required this.bookingDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // 🛡️ Safe Variable Extraction
//     final String ticketId = bookingDetails['id']?.toString() ?? 'PKZ-UNKNOWN';
//     final String facility = bookingDetails['facility']?.toString() ?? 'Smart Parking Lot';
//     final String slot = bookingDetails['slot']?.toString() ?? 'Assigned on Entry';
//     final String plate = bookingDetails['plate']?.toString() ?? 'No Vehicle Linked';
//     final String time = bookingDetails['time']?.toString() ?? 'Active Session';
//     final String amount = bookingDetails['amount']?.toString() ?? '₹30';

//     // 🎫 Generates a pixel-perfect QR Code using Google's secure Chart API
//     final String qrImageUrl = "https://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=$ticketId";

//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         title: const Text(
//           'Parking Ticket', 
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black26, 
//                   blurRadius: 12, 
//                   offset: Offset(0, 4),
//                 )
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   'PARKEASE TICKET', 
//                   style: TextStyle(
//                     fontSize: 13, 
//                     fontWeight: FontWeight.bold, 
//                     color: Colors.grey, 
//                     letterSpacing: 2,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   facility, 
//                   textAlign: TextAlign.center, 
//                   style: const TextStyle(
//                     fontSize: 20, 
//                     fontWeight: FontWeight.bold, 
//                     color: AppColors.primary,
//                   ),
//                 ),
//                 const Divider(height: 32, thickness: 1.2),
                
//                 // 🌐 Web-Safe QR Image Loader Engine
//                 Container(
//                   width: 200,
//                   height: 200,
//                   alignment: Alignment.center,
//                   child: Image.network(
//                     qrImageUrl,
//                     width: 200,
//                     height: 200,
//                     fit: Alignment.contain,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return const Center(
//                         child: CircularProgressIndicator(color: AppColors.accent),
//                       );
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       // Fallback UI icon if internet drops out completely
//                       return const Icon(
//                         Icons.qr_code_2_rounded, 
//                         size: 140, 
//                         color: Colors.grey,
//                       );
//                     },
//                   ),
//                 ),
                
//                 const SizedBox(height: 16),
//                 Text(
//                   'ID: $ticketId', 
//                   style: const TextStyle(
//                     fontFamily: 'Courier', 
//                     fontSize: 14, 
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Divider(height: 32, thickness: 1.2),
                
//                 _buildTicketRow('Slot Number', slot, isBold: true),
//                 _buildTicketRow('Vehicle Plate', plate),
//                 _buildTicketRow('Duration Window', time),
//                 _buildTicketRow('Paid Amount', amount, isPrice: true),
                
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.accent,
//                     minimumSize: const Size.fromHeight(52),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     elevation: 0,
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text(
//                     'Close Ticket', 
//                     style: TextStyle(
//                       color: Colors.white, 
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTicketRow(String label, String value, {bool isBold = false, bool isPrice = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
//           Expanded(
//             child: Text(
//               value,
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: (isBold || isPrice) ? FontWeight.bold : FontWeight.normal,
//                 color: isPrice ? Colors.green : AppColors.textPrimary,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// lib/screens/booking/ticket_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';

// class TicketScreen extends StatelessWidget {
//   final Map<String, dynamic> bookingDetails;
//   const TicketScreen({Key? key, required this.bookingDetails}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String ticketId = bookingDetails['id']?.toString() ?? 'PKZ-UNKNOWN';
//     final String facility = bookingDetails['facility']?.toString() ?? 'Parking Facility';
//     final String slot = bookingDetails['slot']?.toString() ?? 'P-00';
//     final String plate = bookingDetails['plate']?.toString() ?? 'TS-09-EA-1234';
//     final String time = bookingDetails['time']?.toString() ?? '2 Hour Window';
//     final String amount = bookingDetails['amount']?.toString() ?? '₹30';

//     // Google Chart API link creates zero rendering overhead on Web
//     final String qrCodeUrl = "https://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=$ticketId";

//     return Scaffold(
//       backgroundColor: AppColors.primary, // Premium Midnight Dark Blue
//       appBar: AppBar(
//         title: const Text(
//           'Parking Receipt', 
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5),
//         ), 
//         backgroundColor: Colors.transparent, 
//         elevation: 0, 
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Ticket Container Box
//               Container(
//                 width: double.infinity,
//                 // ✅ FIXED: WrappedmaxWidth within a standard BoxConstraints wrapper block
//                 constraints: const BoxConstraints(maxWidth: 400),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(28),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     // Top Section: Header & Location branding
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                             decoration: BoxDecoration(
//                               color: Colors.green.withOpacity(0.12),
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                             child: const Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(Icons.check_circle_rounded, color: Colors.green, size: 16),
//                                 SizedBox(width: 6),
//                                 Text(
//                                   'BOOKING CONFIRMED',
//                                   style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             facility,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 22, 
//                               fontWeight: FontWeight.w800, // ✅ FIXED: Changed from extrabold to w800
//                               color: AppColors.primary, 
//                               letterSpacing: -0.5,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           const Text("Hyderabad, Telangana, India", style: TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w500)),
//                         ],
//                       ),
//                     ),

//                     // Beautiful QR Code Section Card
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.withOpacity(0.04),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.grey.withOpacity(0.1)),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 180,
//                             height: 180,
//                             alignment: Alignment.center,
//                             child: Image.network(
//                               qrCodeUrl,
//                               width: 180,
//                               height: 180,
//                               fit: BoxFit.contain,
//                               loadingBuilder: (_, child, prog) => prog == null ? child : const CircularProgressIndicator(color: AppColors.accent),
//                               errorBuilder: (_, __, ___) => const Icon(Icons.qr_code_2_rounded, size: 120, color: Colors.grey),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Text(
//                             'PASS ID: $ticketId',
//                             style: TextStyle(fontFamily: 'Courier', fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary.withOpacity(0.8), letterSpacing: 0.5),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Modern Boarding Pass Style Dotted / Ticket Divider line
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       child: Row(
//                         children: [
//                           Container(width: 12, height: 24, decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.horizontal(right: Radius.circular(12)))),
//                           Expanded(
//                             child: LayoutBuilder(
//                               builder: (context, constraints) {
//                                 return Flex(
//                                   direction: Axis.horizontal,
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: List.generate(
//                                     (constraints.constrainWidth() / 10).floor(),
//                                     (index) => SizedBox(width: 5, height: 1.5, child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4)))),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           Container(width: 12, height: 24, decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.horizontal(left: Radius.circular(12)))),
//                         ],
//                       ),
//                     ),

//                     // Bottom Section: Detail Metrics Key-Value List Grid 
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
//                       child: Column(
//                         children: [
//                           _buildDetailRow(Icons.pin_drop_rounded, 'Assigned Slot', slot, highlightValue: true),
//                           _buildDetailRow(Icons.directions_car_filled_rounded, 'Vehicle Plate', plate),
//                           _buildDetailRow(Icons.access_time_filled_rounded, 'Duration Window', time),
//                           const Divider(height: 24, thickness: 1),
//                           _buildDetailRow(Icons.payments_rounded, 'Total Paid', amount, isPrice: true),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 28),

//               // Done CTA Button Outside the Ticket Card block
//               ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 400),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.accent, // Brand Vibrant Orange
//                     minimumSize: const Size.fromHeight(56),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//                     elevation: 0,
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Return to Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(IconData icon, String label, String value, {bool highlightValue = false, bool isPrice = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: AppColors.textSecondary.withOpacity(0.8)),
//           const SizedBox(width: 10),
//           Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500)),
//           const Spacer(),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: (highlightValue || isPrice) ? FontWeight.w800 : FontWeight.bold, // ✅ FIXED: Changed extrabold to w800
//               color: isPrice 
//                   ? Colors.green 
//                   : (highlightValue ? AppColors.accent : AppColors.textPrimary),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// lib/screens/booking/ticket_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';

class TicketScreen extends StatelessWidget {
  final Map<String, dynamic> bookingDetails;
  const TicketScreen({Key? key, required this.bookingDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🛡️ Safe variables mapping with foolproof defaults
    final String ticketId = (bookingDetails['id'] ?? 'PKZ-UNKNOWN').toString();
    final String facility = (bookingDetails['facility'] ?? 'Smart Parking Station').toString();
    final String slot = (bookingDetails['slot'] ?? 'Assigned Lot').toString();
    final String plate = (bookingDetails['plate'] ?? 'TS-09-EA-1234').toString();
    final String time = (bookingDetails['time'] ?? '2 Hour Window').toString();
    final String amount = (bookingDetails['amount'] ?? 'Rutine Ticket').toString();

    final String qrCodeUrl = "https://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=$ticketId";

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Parking Receipt', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)), 
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: Colors.green.withOpacity(0.12), borderRadius: BorderRadius.circular(100)),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check_circle_rounded, color: Colors.green, size: 16),
                                SizedBox(width: 6),
                                Text('BOOKING CONFIRMED', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(facility, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary, letterSpacing: -0.5)),
                          const SizedBox(height: 4),
                          const Text("Hyderabad, Telangana, India", style: TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),

                    // QR Window Module
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.04), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.withOpacity(0.1))),
                      child: Column(
                        children: [
                          Container(
                            width: 180, height: 180,
                            alignment: Alignment.center,
                            child: Image.network(
                              qrCodeUrl, width: 180, height: 180, fit: BoxFit.contain,
                              loadingBuilder: (_, child, prog) => prog == null ? child : const CircularProgressIndicator(color: AppColors.accent),
                              errorBuilder: (_, __, ___) => const Icon(Icons.qr_code_2_rounded, size: 120, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text('PASS ID: $ticketId', style: TextStyle(fontFamily: 'Courier', fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary.withOpacity(0.8), letterSpacing: 0.5)),
                        ],
                      ),
                    ),

                    // Boarding pass custom style split lines
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Container(width: 12, height: 24, decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.horizontal(right: Radius.circular(12)))),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constraints.constrainWidth() / 10).floor(),
                                    (index) => SizedBox(width: 5, height: 1.5, child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4)))),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(width: 12, height: 24, decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.horizontal(left: Radius.circular(12)))),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
                      child: Column(
                        children: [
                          _buildDetailRow(Icons.pin_drop_rounded, 'Assigned Slot', slot, highlightValue: true),
                          _buildDetailRow(Icons.directions_car_filled_rounded, 'Vehicle Plate', plate),
                          _buildDetailRow(Icons.access_time_filled_rounded, 'Duration Window', time),
                          const Divider(height: 24, thickness: 1),
                          _buildDetailRow(Icons.payments_rounded, 'Total Paid', amount, isPrice: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, minimumSize: const Size.fromHeight(56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), elevation: 0),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Return to Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, {bool highlightValue = false, bool isPrice = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary.withOpacity(0.8)),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: (highlightValue || isPrice) ? FontWeight.w800 : FontWeight.bold,
              color: isPrice ? Colors.green : (highlightValue ? AppColors.accent : AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}