//
//  SeasonTableView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct SeasonTableView: View {
    @ObservedObject private var store: LeagueSeasonDetailPresenter
    private var presenter: LeagueSeasonDetailProtocol
    
    init(store: LeagueSeasonDetailPresenter, presenter: LeagueSeasonDetailProtocol) {
        self.store = store
        self.presenter = presenter
    }
    var body: some View {
        ZStack {
            switch store.status {
            case .loading:
                ProgressView()
            case .loaded:
                VStack{
                    if let season = store.season {
                        Text(season.name)
                        Text(season.seasonDisplay)
                     
                    }
                }
            case .error:
                ErrorView(errorText: store.errorDescription)
            }
        }
        .navigationBarTitle(store.season?.seasonDisplay ?? "")
        
    }
}

struct SeasonTableView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
