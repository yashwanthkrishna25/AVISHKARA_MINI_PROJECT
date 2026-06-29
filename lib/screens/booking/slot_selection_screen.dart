import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';

class SlotSelectionScreen extends StatefulWidget {
  const SlotSelectionScreen({Key? key}) : super(key: key);

  @override
  State<SlotSelectionScreen> createState() => _SlotSelectionScreenState();
}

class _SlotSelectionScreenState extends State<SlotSelectionScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Select Parking Slot'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                bool isOccupied = index % 3 == 0; 
                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: isOccupied ? null : () {
                    setState(() { selectedIndex = index; });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isOccupied 
                          ? Colors.grey[300] 
                          : (isSelected ? AppColors.accent : Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppColors.accent : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    alignment: Center,
                    child: Text(
                      'P-${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isOccupied 
                            ? Colors.grey[600] 
                            : (isSelected ? Colors.white : AppColors.textPrimary),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: selectedIndex == null ? null : () {
                  // Direct to payment configuration flow
                },
                child: const Text("Continue to Receipt", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          )
        ],
      ),
    );
  }
}