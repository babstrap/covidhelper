class Structure {
  late int structId;
  late String nom;
  late String adresse;
  late int contact;
  late double latitude;
  late double longitude;
  late int nbreTest;
  late int nbreVac;
  late int nbrTestDispo;
  late int nbrVaccinDispo;
  late dynamic? structRvList;

  Structure({
    required this.structId,
    required this.nom,
    required this.adresse,
    required this.contact,
    required this.latitude,
    required this.longitude,
    required this.nbreTest,
    required this.nbreVac,
    required this.nbrTestDispo,
    required this.nbrVaccinDispo,
    this.structRvList,
  });
}
