//
//  TestingArea.swift
//  fStopTimer
//
//  Created by Daniel Springer on 10/27/21.
//

import SwiftUI

struct ExposureTimes: View {
    @State public var additionalExposureTime = [String]()
    @State public var totalExposure = [String]()

    var body: some View {
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().separatorColor = .gray

        return List {
            ForEach(0..<additionalExposureTime.count) { i in
                HStack {
                    Text("\(i): ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.red)

                    Text(additionalExposureTime[i])
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.red)

                    Text(totalExposure[i])
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.red)
                }
            }.listRowBackground(Color.black)
        }

    }
}

//struct ExposureTimesHeader: View {
//    var body: some View {
//
//    }
//}

struct ExposureTimes_Previews: PreviewProvider {
    static var previews: some View {
        ExposureTimes(additionalExposureTime: ["1.0", "2.0","1.0", "2.0","1.0", "21.0","11.0", "2.0","1.0", "2.0","1.0", "2.0","11.0", "21.0","1.0", "21.0","1.0", "2.0","1.0", "2.0","1.0", "2.0"], totalExposure: ["1.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "22.0","12.0", "2.0","1.0", "2.0","1.0", "2.0","1.0", "2.0","12.0", "22.0","221.0", "22.0","12.0", "22.0"])
    }
}
