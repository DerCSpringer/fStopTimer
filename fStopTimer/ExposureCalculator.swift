//
//  ExposureCalculator.swift
//  fStopTimer
//
//  Created by Daniel Springer on 10/27/21.
//

import SwiftUI

struct ExposureCalculator: View {

    @State private var exposureTimes = ExposureTimes(additionalExposureTime: ["1.0", "2.0","1.0", "2.0","1.0", "21.0","11.0", "2.0","1.0", "2.0","1.0", "2.0","11.0", "21.0","1.0", "21.0","1.0", "2.0","1.0", "2.0","1.0", "2.0"], totalExposure: ["1.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "2.0","1.0", "2.0","1.0", "2.0","1.0", "2.0","12.0", "22.0","221.0", "22.0","12.0", "22.0"])

    private let exposureViews = ExposureViews { updateData in
        let exposureCalculator = CalculateTimes()
        print("updated")
//        exposureTimes = ExposureTimes(additionalExposureTime: ["1.0", "2.0","1.0", "2.0","1.0", "21.0","11.0", "2.0","1.0", "2.0","1.0", "2.0","11.0", "21.0","1.0", "21.0","1.0", "2.0","1.0", "2.0","1.0", "2.0"], totalExposure: ["1.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "2.0","1.0", "2.0","1.0", "2.0","1.0", "2.0","12.0", "22.0","221.0", "22.0","12.0", "22.0"])
//        exposureTimes.exposureTimes = ["1.0"]
//        exposureTimes.exposureTimes = exposureCalculator.fStop(testSheet: TestSheet(stopIncrement: 5, startingTime: Double(updateData)!), numberOfStopsBeforeStartingTime: 5.0, numberOfStopsAfterStartingTime: 6.0)
    }

    var body: some View {
        // TODO:
        // 1. Calculate correct values for table
        // 2. transfer data from individual views to table view

        VStack {
            exposureViews
            exposureTimesHeader
            exposureTimes
        }
        .background(.black)
    }

    var exposureTimesHeader: some View {
        HStack {
            Spacer()
            Text("Number").foregroundColor(.red)
            Spacer()
            Text("Addl. Time").foregroundColor(.red)
            Spacer()
            Text("Total Time").foregroundColor(.red)
            Spacer()
        }
    }

}



struct CalculateTimes {
    private func exposureTimes(stopIncrement: Int, numberOfStrips:Int, startingTime: Double) -> [String] {
        var eachTime = [Double]()
        let stopIncrement = (1.0 / Double(stopIncrement))
        for strip in 0...numberOfStrips {
            let totalExposureTimeAtStrip = startingTime * pow(2, Double(strip) * stopIncrement)
            eachTime.append(totalExposureTimeAtStrip)
        }
        return eachTime.map {
            String(format: "%.2f", $0)
        }
    }

    func fStop(testSheet: TestSheet, numberOfStopsBeforeStartingTime:Double, numberOfStopsAfterStartingTime:Double) -> [String] {
        let newStartingTime = testSheet.startingTime * 1 / pow(2, numberOfStopsBeforeStartingTime)
        let numberOfStrips = Int(numberOfStopsBeforeStartingTime + numberOfStopsAfterStartingTime) * testSheet.stopIncrement
        return exposureTimes(stopIncrement: testSheet.stopIncrement, numberOfStrips: numberOfStrips, startingTime: newStartingTime)
    }

}

struct ExposureCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ExposureCalculator()
    }
}
