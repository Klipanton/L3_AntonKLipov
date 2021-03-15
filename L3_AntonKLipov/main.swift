import Foundation

enum WindowState: String {
    case open = "Открыть окна"
    case close = "Закрыть окна"
}

enum TrunkState: String {
    case push = "Погрузить в багажник"
    case pull = "Выгрузить из багажника"
}

enum EngineState: String {
    case start = "Запустить двигатель"
    case stop = "Заглушить двигатель"
}

struct SportCar {
    var brand: String
    var buidYear: Int
    var trunkState: TrunkState
    var trunkOriginalVolume: Double
    var trunkVolume: Double {
        didSet {
            if trunkState == .push {
                let ltr = trunkVolume + oldValue
            print("Груз загружен. Заполненный объем багажника \(ltr)")
            } else {
                let ltr = trunkVolume - oldValue
                print("Груз выгружен. Заполненный объем багажника \(ltr)")
            }
        }
    }
    var engineState: EngineState
    var windowState: WindowState
    mutating func closeWindow () {
        self.windowState = .close
    }
    mutating func openWindow () {
        self.windowState = .open
    }
    mutating func engineStart () {
        self.engineState = .start
    }
    mutating func engineStop () {
        self.engineState = .stop
    }
    mutating func trunkPush () {
        self.trunkState = .push
    }
    mutating func trunkPull () {
        self.trunkState = .pull
    }
}
  
var porsche = SportCar(brand: "Porsche", buidYear: 2020, trunkState: .push, trunkOriginalVolume:30, trunkVolume: 0.0, engineState: .start, windowState: .open )
    
porsche.closeWindow() // .openWindow - откроет окно
porsche.engineStop() // .engineStart - запустит двигатель
porsche.trunkPush() // .trunkPull - вызовет выгрузку из багажника
porsche.trunkVolume = 10 // объем груза (л), которой нужно загрузить / выгрузить

func printCar (carType: SportCar) {
    print ("Бренд: \(carType.brand)")
    print ("Год выпуска: \(carType.buidYear)г.")
    switch carType.windowState {
    case .open:
        print("Окна: открыты")
    case .close:
        print("Окна: закрыты")
    }
    switch carType.engineState {
    case .start:
        print("Двигатель: запущен")
    case .stop:
        print("Двигатель: заглушен")
    }
    print ("-------------------------------")
}

printCar(carType: porsche)

var ferrary = SportCar(brand: "Ferrary", buidYear: 1987, trunkState: .pull, trunkOriginalVolume:15, trunkVolume: 0.0, engineState: .start, windowState: .open )
    
ferrary.openWindow()
ferrary.engineStart()
ferrary.trunkPush()
ferrary.trunkVolume = 20
ferrary.trunkVolume = 30

printCar(carType: ferrary)





