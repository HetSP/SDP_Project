class Flight{
  final String source;
  final String destination;
  final String dateOfFlight;
  final String timeOfFlight;
  final String cap_Economy;
  final String cap_Business;
  final String available_Eco;
  final String available_Bus;
  final String company;
  final String aircraft;
  final String eco_price;
  final String bus_price;

  Flight(this.source, this.destination, this.dateOfFlight, this.timeOfFlight, this.cap_Economy,
      this.cap_Business,this.company, this.aircraft, this.eco_price, this.bus_price, this.available_Eco, this.available_Bus);

  Map<String, dynamic> toJson()=>{
    'source': source,
    'destination': destination,
    'dateOfFlight': dateOfFlight,
    'timeOfFlight': timeOfFlight,
    'cap_Economy': cap_Economy,
    'cap_Business' : cap_Business,
    'available_Bus': available_Bus,
    'available_Eco': available_Eco,
    'company': company,
    'aircraft': aircraft,
    'bus_price': bus_price,
    'eco_price': eco_price,
  };

  static Flight fromJson(Map<String, dynamic> json) => Flight (
      json['source'],
     json['destination'],
    json['dateOfFlight'],
    json['timeOfFlight'],
    json['cap_Economy'],
     json['cap_Business'],
    json['company'],
    json['aircraft'],
    json['eco_price'],
    json['bus_price'],
    json['available_Eco'],
    json['available_Bus'],




  );





}