//
//  FlagRaisingLeaderboardPresentationView.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 17/11/23.
//

import SwiftUI

struct FlagRaisingLeaderboardPresentationView: View {
    enum GroupRange: String {
        case am
        case pm
        case all
    }

    @EnvironmentObject private var discordManager: DiscordManager

    let groupRange: GroupRange

    var totalAMPoints: Int {
        discordManager.activityGroups
            .filter { $0.groupId.hasSuffix("am") }
            .reduce(0) { $0 + $1.points }
    }

    var totalPMPoints: Int {
        discordManager.activityGroups
            .filter { $0.groupId.hasSuffix("pm") }
            .reduce(0) { $0 + $1.points }
    }

    private var sortedGroups: [ActivityGroup] {
        discordManager.activityGroups
            .filter { group in
                switch groupRange {
                case .am:
                    group.groupId.hasSuffix("am")
                case .pm:
                    group.groupId.hasSuffix("pm")
                case .all:
                    true
                }
            }
            .sorted { $0.points > $1.points }
    }

    var body: some View {
        VStack {
            let total = totalAMPoints + totalPMPoints
            
            GeometryReader { reader in
                HStack(spacing: 0) {
                    if total < 1 {
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: reader.size.width / 2)
                    } else {
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: (Double(totalAMPoints) / Double(total)) * reader.size.width)
                    }
                    Spacer()
                }
                .frame(height: 48)
                .background(.orange)
                .overlay {
                    HStack {
                        Text("Morning (\(totalAMPoints))")
                            .foregroundStyle(.black)
                        Spacer()
                        Text("(\(totalPMPoints)) Afternoon")
                            .foregroundStyle(.white)
                    }
                    .font(.system(size: 32, weight: .medium))
                    .padding(.horizontal, 24)
                }
            }
            .frame(height: 48)
            .padding(.top, 48)
            
            HStack {
                ForEach(Array(sortedGroups.enumerated()), id: \.element.id) { index, group in
                    Rectangle()
                        .fill(.clear)
                        .overlay {
                            VStack {
                                Spacer()
                                Image(group.groupId)
                                    .resizable()
                                    .scaledToFit()
                                    .colorInvert()
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .overlay(alignment: .bottom) {
                                        PhaseAnimator([1.0, 0.8, 1.1, 0.9]) { otherPhase in
                                            PhaseAnimator([Color.red, Color.yellow, Color.orange]) { phase in
                                                Image(systemName: "flame")
                                                    .font(.system(size: 64))
                                                    .rotationEffect(.degrees(180))
                                                    .offset(y: 64)
                                                    .foregroundStyle(phase)
                                            }
                                            .scaleEffect(otherPhase)
                                        }
                                    }
                                    .offset(y: -Double(group.points) / 3)
                                Text("\(group.points)")
                                    .font(.system(size: 18, weight: .medium))
                                Text(group.groupName)
                                    .font(.system(size: 18, weight: .bold))
                                    .multilineTextAlignment(.center)
                                    .frame(height: 150, alignment: .top)
                            }
                        }
                }
            }
        }
        .padding(.horizontal, 95)
        .frame(width: 1920, height: 1080)
        .background {
            Color.primary.colorInvert()
        }
        .navigationTitle("\(groupRange.rawValue)")
    }
    
    private func sizeFor(rank: Int) -> Double {
        switch rank {
        case 0: 70 // first place
        case 1: 55 // second place
        case 2: 40 // third place
        default: 30 // everything else
        }
    }
    
    private func colorFor(rank: Int) -> Color {
        switch rank {
        case 0: Color.yellow // first place
        case 1: Color.gray // second place
        case 2: Color.brown // third place
        default: Color.primary // everything else
        }
    }
    
    private func trophyFor(rank: Int) -> String? {
        switch rank {
        case 0: "trophy.fill" // first place
        case 1, 2: "medal.fill" // second, third place
        default: nil // everything else
        }
    }
}

#Preview {
    FlagRaisingLeaderboardPresentationView(groupRange: .all)
        .environmentObject(DiscordManager())
}
