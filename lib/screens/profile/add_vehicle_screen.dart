// // lib/screens/profile/add_vehicle_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';
// import '../../services/firebase_service.dart';

// class AddVehicleScreen extends StatefulWidget {
//   const AddVehicleScreen({Key? key}) : super(key: key);

//   @override
//   State<AddVehicleScreen> createState() => _AddVehicleScreenState();
// }

// class _AddVehicleScreenState extends State<AddVehicleScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _brandController = TextEditingController();
//   final _plateController = TextEditingController();
//   final _ownerController = TextEditingController();
//   bool _isDefault = false;
//   bool _isLoading = false;

//   void _submitVehicle() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isLoading = true);
//     try {
//       // Stream write out directly to Remote Cloud collection matrix nodes
//       await FirebaseService().addVehicle(
//         brand: _brandController.text.trim(),
//         plate: _plateController.text.trim(),
//         owner: _ownerController.text.trim(),
//         isDefault: _isDefault,
//       );

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Vehicle saved securely online!'), backgroundColor: Colors.green),
//         );
//         Navigator.pop(context);
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error saving to Cloud: $e'), backgroundColor: Colors.redAccent),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   void dispose() {
//     _brandController.dispose();
//     _plateController.dispose();
//     _ownerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         title: const Text('Add Vehicle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Icon(Icons.directions_car_filled_rounded, size: 72, color: AppColors.accent),
//               const SizedBox(height: 12),
//               const Text('Register New Vehicle', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
//               const SizedBox(height: 32),
//               _buildInputLabel("Vehicle Brand"),
//               const SizedBox(height: 8),
//               _buildFormField(_brandController, "Enter vehicle brand...", Icons.business_outlined),
//               const SizedBox(height: 20),
//               _buildInputLabel("License Plate Number"),
//               const SizedBox(height: 8),
//               _buildFormField(_plateController, "e.g., TS-09-EA-1234", Icons.pin_outlined, caps: TextCapitalization.characters),
//               const SizedBox(height: 20),
//               _buildInputLabel("Owner Name"),
//               const SizedBox(height: 8),
//               _buildFormField(_ownerController, "Enter owner's name...", Icons.person_outline_rounded, caps: TextCapitalization.words),
//               const SizedBox(height: 24),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Row(
//                       children: [
//                         Icon(Icons.star_rounded, color: AppColors.accent),
//                         SizedBox(width: 12),
//                         Text("Set as Default Vehicle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Switch(value: _isDefault, activeColor: AppColors.accent, onChanged: (v) => setState(() => _isDefault = v)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, minimumSize: const Size.fromHeight(56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
//                 onPressed: _isLoading ? null : _submitVehicle,
//                 child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Vehicle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputLabel(String txt) => Text(txt, style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500));

//   Widget _buildFormField(TextEditingController ctrl, String hint, IconData ico, {TextCapitalization caps = TextCapitalization.none}) {
//     return TextFormField(
//       controller: ctrl,
//       textCapitalization: caps,
//       style: const TextStyle(color: Colors.white),
//       validator: (v) => v!.trim().isEmpty ? 'Required' : null,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white38),
//         prefixIcon: Icon(ico, color: Colors.white60),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.1),
//         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.white.withOpacity(0.15))),
//         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.accent, width: 2)),
//       ),
//     );
//   }
// }


// // lib/screens/profile/add_vehicle_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';
// import '../../services/firebase_service.dart';

// class AddVehicleScreen extends StatefulWidget {
//   const AddVehicleScreen({Key? key}) : super(key: key);

//   @override
//   State<AddVehicleScreen> createState() => _AddVehicleScreenState();
// }

// class _AddVehicleScreenState extends State<AddVehicleScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _brandCtrl = TextEditingController();
//   final _plateCtrl = TextEditingController();
//   final _ownerCtrl = TextEditingController();
//   bool _isDefault = false;
//   bool _isLoading = false;

//   void _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     setState(() => _isLoading = true);
//     try {
//       await FirebaseService().addVehicle(brand: _brandCtrl.text.trim(), plate: _plateCtrl.text.trim(), owner: _ownerCtrl.text.trim(), isDefault: _isDefault);
//       if (mounted) Navigator.pop(context);
//     } catch (e) {
//       if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submission Error: $e'), backgroundColor: Colors.red));
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   void dispose() { _brandCtrl.dispose(); _plateCtrl.dispose(); _ownerCtrl.dispose(); super.dispose(); }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(title: const Text('Add Vehicle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white)),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Icon(Icons.directions_car_filled_rounded, size: 72, color: AppColors.accent),
//               const SizedBox(height: 32),
//               _lbl("Vehicle Brand"), const SizedBox(height: 8),
//               _field(_brandCtrl, "e.g., KIA, Tesla", Icons.business_outlined),
//               const SizedBox(height: 20),
//               _lbl("License Plate"), const SizedBox(height: 8),
//               _field(_plateCtrl, "e.g., TS-09-EA-1234", Icons.pin_outlined, caps: TextCapitalization.characters),
//               const SizedBox(height: 20),
//               _lbl("Owner Name"), const SizedBox(height: 8),
//               _field(_ownerCtrl, "Enter full name", Icons.person_outline_rounded, caps: TextCapitalization.words),
//               const SizedBox(height: 24),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
//                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                   const Row(children: [Icon(Icons.star_rounded, color: AppColors.accent), SizedBox(width: 12), Text("Set as Default Vehicle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
//                   Switch(value: _isDefault, activeColor: AppColors.accent, onChanged: (v) => setState(() => _isDefault = v)),
//                 ]),
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, minimumSize: const Size.fromHeight(56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
//                 onPressed: _isLoading ? null : _submit,
//                 child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Vehicle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _lbl(String s) => Text(s, style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500));
//   Widget _field(TextEditingController c, String h, IconData i, {TextCapitalization caps = TextCapitalization.none}) {
//     return TextFormField(
//       controller: c, textCapitalization: caps, style: const TextStyle(color: Colors.white),
//       validator: (v) => v!.trim().isEmpty ? 'Required' : null,
//       decoration: InputDecoration(
//         hintText: h, hintStyle: const TextStyle(color: Colors.white38), prefixIcon: Icon(i, color: Colors.white60), filled: true, fillColor: Colors.white.withOpacity(0.1),
//         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.white.withOpacity(0.15))),
//         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.accent, width: 2)),
//       ),
//     );
//   }
// }




// lib/screens/profile/add_vehicle_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../services/firebase_service.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _brandCtrl = TextEditingController();
  final _plateCtrl = TextEditingController();
  final _ownerCtrl = TextEditingController();
  bool _isDefault = false;
  bool _isLoading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    
    try {
      // Writes cleanly using lowercase tags to eliminate map reading matching conflicts
      await FirebaseService().addVehicle(
        brand: _brandCtrl.text.trim(),
        plate: _plateCtrl.text.trim().toUpperCase(), // Enforce uniform uppercase license plates
        owner: _ownerCtrl.text.trim(),
        isDefault: _isDefault,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vehicle linked successfully!'), backgroundColor: Colors.green),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Submission Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _brandCtrl.dispose();
    _plateCtrl.dispose();
    _ownerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Add Vehicle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.directions_car_filled_rounded, size: 72, color: AppColors.accent),
              const SizedBox(height: 32),
              _lbl("Vehicle Brand"),
              const SizedBox(height: 8),
              _field(_brandCtrl, "e.g., KIA, Hyundai", Icons.business_outlined),
              const SizedBox(height: 20),
              _lbl("License Plate Number"),
              const SizedBox(height: 8),
              _field(_plateCtrl, "e.g., TS-09-EA-1234", Icons.pin_outlined, caps: TextCapitalization.characters),
              const SizedBox(height: 20),
              _lbl("Owner Name"),
              const SizedBox(height: 8),
              _field(_ownerCtrl, "Enter owner's full name", Icons.person_outline_rounded, caps: TextCapitalization.words),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star_rounded, color: AppColors.accent),
                        SizedBox(width: 12),
                        Text("Set as Default Vehicle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Switch(
                      value: _isDefault, 
                      activeColor: AppColors.accent, 
                      onChanged: (v) => setState(() => _isDefault = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent, 
                  minimumSize: const Size.fromHeight(56), 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _isLoading ? null : _submit,
                child: _isLoading 
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                    : const Text('Save Vehicle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lbl(String s) => Text(s, style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500));
  
  Widget _field(TextEditingController c, String h, IconData i, {TextCapitalization caps = TextCapitalization.none}) {
    return TextFormField(
      controller: c,
      textCapitalization: caps,
      style: const TextStyle(color: Colors.white),
      validator: (v) => v!.trim().isEmpty ? 'Field required' : null,
      decoration: InputDecoration(
        hintText: h,
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Icon(i, color: Colors.white60),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.white.withOpacity(0.15))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.accent, width: 2)),
      ),
    );
  }
}