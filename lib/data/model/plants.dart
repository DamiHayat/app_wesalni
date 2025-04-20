import 'package:flutter/material.dart';

class Plant {
  final int plantId;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorited;
  final String description;
  bool isSelected;
  final String plantType; // 1. Type de plante
  final String waterNeed; // 2. Besoin en eau
  final String environmentalConditions; // 3. Conditions environnementales
  final String soilType; // 4. Type de sol
  final String wateringMethod; // 5. Méthode d'arrosage
  final String wateringFrequency; // 6. Fréquence d'arrosage
  final String waterConservationTechniques; // 7. Techniques de conservation de l'eau

  Plant({
    required this.plantId,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.category,
    required this.plantName,
    required this.imageURL,
    required this.isFavorited,
    required this.description,
    required this.isSelected,
    required this.plantType,
    required this.waterNeed,
    required this.environmentalConditions,
    required this.soilType,
    required this.wateringMethod,
    required this.wateringFrequency,
    required this.waterConservationTechniques,
  });

  // Liste des données des plantes
  static List<Plant> plantList = [
    Plant(
      plantId: 0,
      size: 'Petite',
      rating: 4.5,
      humidity: 34,
      temperature: '23 - 34',
      category: 'Intérieur',
      plantName: 'Sanseviera',
      imageURL: 'assets/images/plant-one.png',
      isFavorited: true,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Vivace', // Exemple de type de plante
      waterNeed: 'Faible', // Exemple de besoin en eau
      environmentalConditions: 'Lumière indirecte', // Exemple de conditions environnementales
      soilType: 'Sol bien drainé', // Exemple de type de sol
      wateringMethod: 'Arrosage par le bas', // Exemple de méthode d'arrosage
      wateringFrequency: 'Une fois par semaine', // Exemple de fréquence d'arrosage
      waterConservationTechniques:
      'Paillage', // Exemple de techniques de conservation de l'eau
    ),
    Plant(
      plantId: 1,
      size: 'Moyenne',
      rating: 4.8,
      humidity: 56,
      temperature: '19 - 22',
      category: 'Extérieur',
      plantName: 'Philodendron',
      imageURL: 'assets/images/plant-two.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Tropicale',
      waterNeed: 'Modérée',
      environmentalConditions: 'Lumière indirecte',
      soilType: 'Sol bien drainé',
      wateringMethod: 'Arrosage par le haut',
      wateringFrequency: 'Deux fois par semaine',
      waterConservationTechniques: 'Irrigation goutte à goutte',
    ),
    Plant(
      plantId: 2,
      size: 'Grande',
      rating: 4.7,
      humidity: 34,
      temperature: '22 - 25',
      category: 'Intérieur',
      plantName: 'Marguerite de plage',
      imageURL: 'assets/images/plant-three.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Annuelle',
      waterNeed: 'Élevée',
      environmentalConditions: 'Lumière directe du soleil',
      soilType: 'Sol sableux',
      wateringMethod: 'Système d\'arrosage automatique',
      wateringFrequency: 'Tous les deux jours',
      waterConservationTechniques: 'Collecte des eaux de pluie',
    ),
    Plant(
      plantId: 3,
      size: 'Petite',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      category: 'Extérieur',
      plantName: 'Grand Bluestem',
      imageURL: 'assets/images/plant-four.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Herbe',
      waterNeed: 'Faible',
      environmentalConditions: 'Plein soleil',
      soilType: 'Sol argileux',
      wateringMethod: 'Arrosage manuel',
      wateringFrequency: 'Une fois toutes les deux semaines',
      waterConservationTechniques: 'Xéroscopie',
    ),
    Plant(
      plantId: 4,
      size: 'Grande',
      rating: 4.1,
      humidity: 66,
      temperature: '12 - 16',
      category: 'Recommandé',
      plantName: 'Tulipe',
      imageURL: 'assets/images/plant-five.png',
      isFavorited: true,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Ampoule',
      waterNeed: 'Élevée',
      environmentalConditions: 'Demi-ombre',
      soilType: 'Sol limoneux',
      wateringMethod: 'Tuyau poreux',
      wateringFrequency: 'Une fois par semaine',
      waterConservationTechniques: 'Culture compagnon',
    ),
    Plant(
      plantId: 5,
      size: 'Moyenne',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      category: 'Extérieur',
      plantName: 'Sauge des prés',
      imageURL: 'assets/images/plant-six.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Vivace',
      waterNeed: 'Modérée',
      environmentalConditions: 'Plein soleil',
      soilType: 'Limono-sableux',
      wateringMethod: 'Irrigation goutte à goutte',
      wateringFrequency: 'Deux fois par semaine',
      waterConservationTechniques: 'Paillage',
    ),
    Plant(
      plantId: 6,
      size: 'Petite',
      rating: 4.2,
      humidity: 46,
      temperature: '23 - 26',
      category: 'Jardin',
      plantName: 'Plumbago',
      imageURL: 'assets/images/plant-seven.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Arbuste',
      waterNeed: 'Faible',
      environmentalConditions: 'Ombre partielle',
      soilType: 'Sol acide',
      wateringMethod: 'Arrosage à la main',
      wateringFrequency: 'Une fois par semaine',
      waterConservationTechniques: 'Collecte d\'eau de pluie',
    ),
    Plant(
      plantId: 7,
      size: 'Moyenne',
      rating: 4.5,
      humidity: 34,
      temperature: '21 - 24',
      category: 'Jardin',
      plantName: 'Tritonia',
      imageURL: 'assets/images/plant-seven.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Corme',
      waterNeed: 'Modérée',
      environmentalConditions: 'Ombre partielle',
      soilType: 'Sol bien drainé',
      wateringMethod: 'Arrosage automatique',
      wateringFrequency: 'Un jour sur deux',
      waterConservationTechniques: 'Irrigation goutte à goutte',
    ),
    Plant(
      plantId: 8,
      size: 'Moyenne',
      rating: 4.7,
      humidity: 46,
      temperature: '21 - 25',
      category: 'Recommandé',
      plantName: 'Pivoine',
      imageURL: 'assets/images/plant-eight.png',
      isFavorited: false,
      description:
      'Cette plante est l\'une des meilleures plantes. Elle pousse dans la plupart des régions du monde et peut survivre même aux conditions météorologiques les plus difficiles.',
      isSelected: false,
      plantType: 'Vivace herbacée',
      waterNeed: 'Élevée',
      environmentalConditions: 'Plein soleil',
      soilType: 'Sol bien drainé',
      wateringMethod: 'Tuyau poreux',
      wateringFrequency: 'Une fois par semaine',
      waterConservationTechniques: 'Culture compagnon',
    ),

    // Ajouter d'autres plantes au besoin
  ];

  // Récupérer les éléments favoris
  static List<Plant> getFavoritedPlants() {
    return plantList.where((element) => element.isFavorited).toList();
  }

  // Récupérer les éléments du panier
  static List<Plant> addedToCartPlants() {
    return plantList.where((element) => element.isSelected).toList();
  }
}
