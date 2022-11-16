class Ticket{
  final String source;
  final String destination;
  final DateTime dateandtime;
  final double duration;
  final int capacity;
  final int available;
  final String company;
  final String aircraft;
  final String status;
  final int base_price;

  Ticket(this.source, this.destination, this.dateandtime, this.duration,this.capacity,
      this.available ,this.company, this.aircraft, this.status, this.base_price);

  Map<String, dynamic> toJson()=>{
    'source': source,
    'destination': destination,
    'dateandtime': dateandtime,
    'duration': duration,
    'capacity': capacity,
    'available' : available,
    'company': company,
    'aircraft': aircraft,
    'base_price': base_price,
    'status': status,
  };


}