import SwiftUI
import ActivityKit

struct InterventionAttributes: ActivityAttributes {
    public typealias InterventionStatus = ContentState

    // Variables
    public struct ContentState: Codable, Hashable {
        var IntervenantName: String
        var estimatedInterventionTime: ClosedRange<Date>
    }

    // Variables dont les valeurs ne changent
    //var totalAmount: String
}
