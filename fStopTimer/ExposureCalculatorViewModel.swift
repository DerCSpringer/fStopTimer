//
//  ExposureCalculatorViewModel.swift
//  fStopTimer
//
//  Created by Daniel Springer on 10/29/21.
//

import Foundation

struct TestSheet {
    let stopIncrement: Int
    let startingTime: Double
    let numberOfStrips: Int?

    init(stopIncrement: Int, startingTime: Double, numberOfStrips: Int? = nil) {
        self.stopIncrement = stopIncrement
        self.startingTime = startingTime
        self.numberOfStrips = numberOfStrips
    }
}

struct ExposureCalculatorViewModel {

    private func exposureTimes(testSheet: TestSheet) -> [String] {
        guard let numberOfStrips = testSheet.numberOfStrips else { return [""] }
        var eachTime = [Double]()
        let stopIncrement = (1.0 / Double(testSheet.stopIncrement))
        for strip in 0...numberOfStrips {
            let totalExposureTimeAtStrip = testSheet.startingTime * pow(2, Double(strip) * stopIncrement)
            eachTime.append(totalExposureTimeAtStrip)
        }
        return eachTime.map {
            String(format: "%.2f", $0)
        }
    }

    func fStop(testSheet: TestSheet, numberOfStopsBeforeStartingTime:Double, numberOfStopsAfterStartingTime:Double) -> [String] {
        let newStartingTime = testSheet.startingTime * 1 / pow(2, numberOfStopsBeforeStartingTime)
        let numberOfStrips = Int(numberOfStopsBeforeStartingTime + numberOfStopsAfterStartingTime) * testSheet.stopIncrement
        let testSheet = TestSheet(stopIncrement: testSheet.stopIncrement, startingTime: newStartingTime, numberOfStrips: numberOfStrips)
        return exposureTimes(testSheet: testSheet)
    }



}
