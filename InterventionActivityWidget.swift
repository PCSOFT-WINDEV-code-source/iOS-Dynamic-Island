import ActivityKit
import WidgetKit
import SwiftUI

@available(iOSApplicationExtension 16.1, *)
struct InterventionActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: InterventionAttributes.self) { context in
            // For devices that don't support the Dynamic Island.
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your \(context.state.IntervenantName) is on the way!")
                            .font(.headline)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.secondary)
                            HStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.blue)
                                    .frame(width: 50)
                                Image(systemName: "shippingbox.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.leading, -25)
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white.opacity(0.5))
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white.opacity(0.5))
                                Text(timerInterval: context.state.estimatedInterventionTime, countsDown: true)
                                    .bold()
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.center)
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white.opacity(0.5))
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white.opacity(0.5))
                                Image(systemName: "house.circle.fill")
                                    .foregroundColor(.green)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Spacer()
                    VStack {
                        Text("\(3) 🍕")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                }.padding(5)
                Text("You've already paid: \(9) + $9.9 Delivery Fee 💸")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 5)
            }.padding(15)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Label("Intervention", systemImage: "wrench.adjustable")
                        .font(.title2)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Label {
                        Text(timerInterval: context.state.estimatedInterventionTime, countsDown: true)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 50)
                            .monospacedDigit()
                            .font(.caption)
                    } icon: {
                        Image(systemName: "timer")
                    }
                    .font(.title3)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("Générateur éolienne C122MT")
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    // Deep Linking test
                     Link(destination: URL(string: "eole://TIM")!) {
                         Label("Détails", systemImage: "magnifyingglass").padding()
                     }.background(Color.accentColor)
                     .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            } compactLeading: {
                Label {
                    Text("Intervention")
                } icon: {
                    Image(systemName: "wrench.adjustable")
                }
                .font(.caption2)
            } compactTrailing: {
                Text(timerInterval: context.state.estimatedInterventionTime, countsDown: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 40)
                    .font(.caption2)
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(timerInterval: context.state.estimatedInterventionTime, countsDown: true)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }
            .keylineTint(.accentColor)
        }
    }
}
