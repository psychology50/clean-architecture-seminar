//
//  DependencyInversion.swift
//  clean-architecture-seminar
//
//  Created by 양재서 on 9/2/24.
//

import Foundation

/// Car 명세

protocol Car {
    func drive()
    func stop()
}

/// Car의 구현 클래스들

class SportCar: Car {
    func drive() {
        print("SportCar is driving")
    }
    
    func stop() {
        print("SportCar is stopping")
    }
}

/// Car 프로토콜에 의존하는 클래스

class TrackDriver {
    private let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    func start() {
        car.drive()
    }
    
    func end() {
        car.stop()
    }
}

class Main {
    func main() {
        let 스포츠카_신얀: TrackDriver = TrackDriver(car: SportCar())
        스포츠카_신얀.start()
        
        let 야가다_신얀: TrackDriver = TrackDriver(car: Truck())
        야가다_신얀.start()
    }
}







class Truck: Car {
    func drive() {
        print("Truck is driving")
    }
    
    func stop() {
        print("Truck is stopping")
    }
}

class Bus {
    func drive() {
        print("Bus is driving")
    }
    
    func stop() {
        print("Bus is stopping")
    }
}

class ElectricCar: Car {
    func drive() {
        print("ElectricCar is driving")
    }
    
    func stop() {
        print("ElectricCar is stopping")
    }
    
    func charge() {
        print("ElectricCar is charging")
    }
}

