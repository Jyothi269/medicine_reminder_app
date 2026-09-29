import 'package:flutter/material.dart';

void main() {
  runApp(const MedicineReminderApp());
}

class MedicineReminderApp extends StatelessWidget {
  const MedicineReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
      ),
      home: const HomeScreen(),
    );
  }
}

// Medicine Model
class Medicine {
  final String name;
  final String dosage;
  final String time;

  Medicine({
    required this.name,
    required this.dosage,
    required this.time,
  });
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Medicine> medicines = [];

  // Open Add Medicine Screen
  Future<void> openAddMedicine() async {
    final Medicine? medicine = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddMedicineScreen(),
      ),
    );

    if (medicine != null) {
      setState(() {
        medicines.add(medicine);
      });
    }
  }

  // Delete Medicine
  void deleteMedicine(int index) {
    setState(() {
      medicines.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Medicine deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medicine Reminder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Good Morning 👋💊',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Keep track of your medicines easily.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Today's Medicines",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: medicines.isEmpty
                  ? Card(
                      elevation: 3,
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.medication),
                        ),
                        title: const Text(
                          'No medicines added',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'Add your first medicine reminder',
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = medicines[index];

                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.medication),
                            ),

                            title: Text(
                              medicine.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            subtitle: Text(
                              '${medicine.dosage} • ${medicine.time}',
                            ),

                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteMedicine(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: openAddMedicine,
                icon: const Icon(Icons.add),

                label: const Text(
                  'Add Medicine',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Add Medicine Screen
class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() =>
      _AddMedicineScreenState();
}

class _AddMedicineScreenState
    extends State<AddMedicineScreen> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController dosageController =
      TextEditingController();

  TimeOfDay? selectedTime;

  // Select Reminder Time
  Future<void> selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  // Save Medicine
  void saveMedicine() {
    if (nameController.text.trim().isEmpty ||
        dosageController.text.trim().isEmpty ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all details',
          ),
        ),
      );

      return;
    }

    final Medicine medicine = Medicine(
      name: nameController.text.trim(),
      dosage: dosageController.text.trim(),
      time: selectedTime!.format(context),
    );

    Navigator.pop(context, medicine);
  }

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Medicine',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Medicine Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // Medicine Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Medicine Name',
                hintText: 'Enter medicine name',
                prefixIcon: const Icon(
                  Icons.medication,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dosage
            TextField(
              controller: dosageController,
              decoration: InputDecoration(
                labelText: 'Dosage',
                hintText: 'Example: 1 tablet',
                prefixIcon: const Icon(
                  Icons.local_pharmacy,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Time Selection
            InkWell(
              onTap: selectTime,

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                    ),

                    const SizedBox(width: 15),

                    Text(
                      selectedTime == null
                          ? 'Select Reminder Time'
                          : selectedTime!.format(context),

                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: saveMedicine,

                icon: const Icon(
                  Icons.save,
                ),

                label: const Text(
                  'Save Medicine',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}