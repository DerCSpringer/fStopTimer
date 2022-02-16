//
//  TimeView.swift
//  fStopTimer
//
//  Created by Daniel Springer on 10/25/21.
//

import SwiftUI


class ExposureViewValues: ExposureViewValueType {
    @Published var stopIncrement: Int = 0
    @Published var stopsAfterTime: Int = 0
    @Published var stopsBeforeTime: Int = 0
    @Published var time: Double = 0.0
}

enum ExposureParameter {
    case stopIncrement
    case stopsAfterTime
    case stopsBeforeTime
    case time
}

protocol ExposureViewValueType: ObservableObject {
    var stopIncrement: Int { get set }
    var stopsAfterTime: Int { get set }
    var stopsBeforeTime: Int { get set }
    var time: Double { get set }
//    var exposureValues: ExposureViewValues { get set }
//    var exposureValueType: ExposureParameter { get }
    //    var quantityOfMeasurement: String { get set }
    //    func setValue()
}

//protocol ExposureViewType: ObservableObject {
protocol ExposureViewType {
    var exposureViewValues: ExposureViewValues { get }
    var exposureValueType: ExposureParameter { get }
    var quantityOfMeasurement: String { get set }
    func setValue()
}

extension ExposureViewType {
    func setValue() {
        switch exposureValueType {
        case .stopIncrement:
            exposureViewValues.stopIncrement = Int(quantityOfMeasurement)!
        case .stopsAfterTime:
            exposureViewValues.stopsAfterTime = Int(quantityOfMeasurement)!
        case .stopsBeforeTime:
            exposureViewValues.stopsBeforeTime = Int(quantityOfMeasurement)!
        case .time:
            exposureViewValues.time = Double(quantityOfMeasurement)!
        }
    }
}


struct ExposureParameterView: View {
    public let measurementName: String
    public let measurementValues: [String]

    @State private var quantityOfMeasurement = "0"
    @State private var showActionSheet = false

//    var viewModel: Model

    var body: some View {
        Button {
            showActionSheet = true
        }
    label: {
        Text("\(measurementName) \n \(quantityOfMeasurement)")
            .font(.title)
            .foregroundColor(Color(red: 0.4, green: 0.0, blue: 0.0, opacity: 1))
            .frame(width: 150.0, height: 100.0, alignment: .center)

    }
    .background(.red)
    .cornerRadius(10)
    .confirmationDialog("Stops after time",
                        isPresented: $showActionSheet,
                        presenting: measurementValues) { data in
        ForEach(data, id: \.self) { item in
            Button {
                quantityOfMeasurement = item
//                viewModel.setValue()
            } label: {
                Text(item)
            }
        }
    }

    }
}

struct ExposureViews: View {
    static let minA = 150.0
    let a = [GridItem(.adaptive(minimum: minA, maximum: minA)), GridItem(.adaptive(minimum: minA, maximum: minA))]
    let b = [GridItem(), GridItem()]
    let c = [GridItem(.adaptive(minimum: minA, maximum: minA))]
    let d = [GridItem(.fixed(150.0)), GridItem(.fixed(150.0))]
    @ObservedObject var exposureViewValues = ExposureViewValues()
    public var didUpdateExposure: ((ExposureViewValues) -> ())?
    var body: some View {
            LazyVGrid(columns: d) {
                stopIncrement
                stopsAfterTime
                stopsBeforeTime
                time
            }
    }

    var stopIncrement: some View {
        ExposureParameterView(measurementName: "Stop Increment",
                              measurementValues: ["1", "1/2", "1/3", "1/4", "1/5", "1/6", "1/7", "1/8", "1/9"])
        //,viewModel: exposureViewValues)
    }
    var stopsAfterTime: some View {
        ExposureParameterView(measurementName: "Stops after time",
                              measurementValues: ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"])
                              //,exposureViewValues: exposureViewValues)
    }

    var stopsBeforeTime: some View {
        ExposureParameterView(measurementName: "Stops before time",
                              measurementValues: ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"])
                              //,exposureViewValues: exposureViewValues)
    }

    var time: some View {

        @State var time: Decimal.FormatStyle.FormatInput = 0.0

        return VStack {
            Text("Time")
                .font(.title)
                .foregroundColor(Color(red: 0.4, green: 0.0, blue: 0.0, opacity: 1))
            TextField("Exposure Time", value: $time, format: .number, prompt: Text("Time"))
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.4, green: 0.0, blue: 0.0, opacity: 1))

        }
        .frame(width: 150.0, height: 100.0, alignment: .center)
        .background(.red)
        .cornerRadius(10)

    }



}

struct ExposureViews_Previews: PreviewProvider {
    static var previews: some View {
        ExposureViews()
    }
}
