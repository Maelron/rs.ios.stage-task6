import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var seatsCount: Int
    var availableSeats = Set<Int>()
    
    init(n: Int) {
        self.seatsCount = n
        for i in 0 ..< seatsCount {
            availableSeats.insert(i)
        }
    }
     
    func seat() -> Int {
        var seatToReturn = -1
        
        if seats == [] {
            seats.append(0)
            availableSeats.remove(0)
            seatToReturn = 0
            return seatToReturn
        }
        if seats.first != 0 {
            seats.insert(0, at: 0)
            availableSeats.remove(0)
            seatToReturn = 0
            return seatToReturn
        }
        if seats.last != seatsCount - 1 {
            seats.append(seatsCount - 1)
            availableSeats.remove(seatsCount - 1)
            seatToReturn = seatsCount - 1
            return seatToReturn
        }
        
        var maxDistance = 0
        var tempSeat = -1
        for availableSeat in availableSeats.sorted() {
            for i in 1 ..< seats.count {
                if availableSeat > seats[i-1] && availableSeat < seats[i] {
                    if maxDistance < seats[i] - availableSeat && maxDistance < availableSeat - seats[i-1] {
                        tempSeat = availableSeat
                        maxDistance = availableSeat - seats[i-1]
                    }
                }
            }
        }
        
        seats.append(tempSeat)
        seatToReturn = availableSeats.remove(tempSeat)!
        
        seats.sort { $0 < $1 }
        
        return seatToReturn
    }
     
    func leave(_ p: Int) {
        guard let indexOfP = seats.firstIndex(of: p) else { return }
        seats.remove(at: indexOfP)
        availableSeats.insert(p)
    }
}
