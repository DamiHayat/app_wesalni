import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bus_detail_controller.dart';
import '../../core/constant/routes.dart';

class BusDetailScreen extends StatefulWidget {
  const BusDetailScreen({super.key});

  @override
  State<BusDetailScreen> createState() => _BusDetailScreenState();
}

class _BusDetailScreenState extends State<BusDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ✅ Inject the controller only if it's not already registered
    if (!Get.isRegistered<BusDetailController>()) {
      Get.put(BusDetailController());
    }

    return GetBuilder<BusDetailController>(
      builder: (controller) => Scaffold(

        body: const Center(
          child: Text('Aucun bus n’a encore été ajouté ! Veuillez en ajouter un pour continuer.'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addBusDetails(size),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void addBusDetails(Size size) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Form(
          child: Container(
            height: size.height * 0.65,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Your Bus Here',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nom du bus',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.directions_bus),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Le nom du bus est requis';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Numéro du bus',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.confirmation_number),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Le numéro du bus est requis';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner un arrêt de départ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'De',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.arrow_circle_up),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: '6.9336339,79.8526605',
                      child: Text('Le Barad et Corniche'),
                    ),
                    DropdownMenuItem(
                      value: '7.0923857,79.9891625',
                      child: Text('Avenue Ba Hnini'),
                    ),
                    DropdownMenuItem(
                      value: '6.7744328,79.8801515',
                      child: Text('Rambouan Satyam'),
                    ),
                    DropdownMenuItem(
                      value: '6.9346378,79.9814374',
                      child: Text('Rambouan Lkhawai'),
                    ),
                    DropdownMenuItem(
                      value: '6.9111207,79.7049656',
                      child: Text('École Al-Irfane'),
                    ),
                    DropdownMenuItem(
                      value: '6.0329092,80.2131825',
                      child: Text('Rambouan Regency'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner un arrêt de destination';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'To',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.arrow_circle_down),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: '6.9336339,79.8526605',
                      child: Text('Le Barad et Corniche'),
                    ),
                    DropdownMenuItem(
                      value: '7.0923857,79.9891625',
                      child: Text('Avenue Ba Hnini'),
                    ),
                    DropdownMenuItem(
                      value: '6.7744328,79.8801515',
                      child: Text('Rambouan Satyam'),
                    ),
                    DropdownMenuItem(
                      value: '6.9346378,79.9814374',
                      child: Text('Rambouan Lkhawai'),
                    ),
                    DropdownMenuItem(
                      value: '6.9111207,79.7049656',
                      child: Text('École Al-Irfane'),
                    ),
                    DropdownMenuItem(
                      value: '6.0329092,80.2131825',
                      child: Text('Rambouan Regency'),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Soumettre'),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
