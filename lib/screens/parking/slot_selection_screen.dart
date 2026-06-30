import 'package:flutter/material.dart';

class SlotSelectionScreen extends StatefulWidget {
  const SlotSelectionScreen({super.key});

  @override
  State<SlotSelectionScreen> createState() =>
      _SlotSelectionScreenState();
}

class _SlotSelectionScreenState
    extends State<SlotSelectionScreen> {

  String? selectedSlot;

  final List<String> occupied = [
    "A2",
    "A5",
    "B3",
    "B5",
    "C4",
    "D2",
    "D6",
    "E3",
  ];

  final List<String> slots = List.generate(
    30,
    (index) {
      final row =
          String.fromCharCode(65 + index ~/ 6);
      final col = (index % 6) + 1;
      return "$row$col";
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Choose Parking Slot"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Select Available Slot",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [

                legend(Colors.green, "Available"),

                legend(Colors.red, "Occupied"),

                legend(
                    Colors.blue, "Selected"),
              ],
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.builder(
                itemCount: slots.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                ),

                itemBuilder: (_, index) {
                  final slot = slots[index];

                  bool isOccupied =
                      occupied.contains(slot);

                  bool isSelected =
                      selectedSlot == slot;

                  Color color;

                  if (isSelected) {
                    color = Colors.blue;
                  } else if (isOccupied) {
                    color = Colors.red;
                  } else {
                    color = Colors.green;
                  }

                  return GestureDetector(
                    onTap: isOccupied
                        ? null
                        : () {
                            setState(() {
                              selectedSlot = slot;
                            });
                          },

                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),

                      child: Center(
                        child: Text(
                          slot,
                          style:
                              const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: selectedSlot == null
                    ? null
                    : () {
                        Navigator.pushNamed(
                          context,
                          "/booking-summary",
                          arguments:
                              selectedSlot,
                        );
                      },

                child: Text(
                  selectedSlot == null
                      ? "Select Slot"
                      : "Continue ($selectedSlot)",
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget legend(Color color, String text) {
    return Row(
      children: [

        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(5),
          ),
        ),

        const SizedBox(width: 6),

        Text(text),
      ],
    );
  }
}