//
//  Reducers.swift
//  RxReduceDemo
//
//  Created by Thibault Wittemberg on 18-04-28.
//  Copyright © 2018 Wittemberg, Thibault. All rights reserved.
//

import Foundation
import RxReduce

func movieReducer (state: AppState?, action: Action) -> AppState {

    var currentState = state ?? AppState(movieListState: .empty, movieDetailState: .empty)

    // according to the action we create a new state
    switch action {
    case is FetchMovieListAction:
        currentState.movieListState = .loading
        return currentState
    case let action as LoadMovieListAction:
        currentState.movieListState = .loaded(action.movies)
        return currentState
    case let action as LoadMovieAction:
        currentState.movieDetailState = .loaded(action.movie)
        return currentState
    default:
        return currentState
    }
}
