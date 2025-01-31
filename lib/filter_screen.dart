import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedCategory = "EDT"; // Default selected radio button
  List<String> selectedColors = []; // Selected color checkboxes
  String selectedFilter = "Categories"; // Sidebar selection

  final Map<String, Color> colorsMap = {
    "Blue": Colors.blue,
    "Red": Colors.red,
    "Green": Colors.green,
    "Yellow": Colors.yellow,
    "Rose Gold": Colors.pink.shade200,
    "Black Silver": Colors.black54,
    "White": Colors.white,
  };

  final List<String> categories = [
    "EDT",
    "EDP",
    "Musk",
    "Mamoul",
    "Oud Burner"
  ];

  final List<String> filterOptions = [
    "Categories",
    "Colour",
    "Horoscope",
    "Size",
    "Gender",
    "Series",
    "Price Range",
    "Discount",
    "Occasion",
    "Ingredients"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Filters", style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Sidebar for Filter Options
          Container(
            width: 120,
            color: Colors.black,
            child: ListView.builder(
              itemCount: filterOptions.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedFilter == filterOptions[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filterOptions[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                      if (filterOptions[index] == "Colour" &&
                          selectedColors.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${selectedColors.length}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  selected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedFilter = filterOptions[index];
                    });
                  },
                );
              },
            ),
          ),

          // Right Side: Filter Selection (Categories or Colour)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: selectedFilter == "Categories"
                  ? buildCategorySelection()
                  : buildColorSelection(),
            ),
          ),
        ],
      ),

      // Bottom Buttons (Clear All & Apply)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = "EDT";
                    selectedColors.clear();
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                child: const Text("Clear All",
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filter logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child:
                    const Text("Apply", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for selecting categories (Radio Buttons)
  Widget buildCategorySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Categories",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: categories.map((category) {
            return RadioListTile<String>(
              title: Text(category),
              value: category,
              groupValue: selectedCategory,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }


  // Widget for selecting colors (Checkboxes)
  Widget buildColorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Colours",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: colorsMap.keys.map((color) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedColors.contains(color),
                      activeColor: Colors.black,
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedColors.add(color);
                          } else {
                            selectedColors.remove(color);
                          }
                        });
                      },
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: colorsMap[color],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "$color ( ${colorsMap.keys.toList().indexOf(color) + 1} )",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
