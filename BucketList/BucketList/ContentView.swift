//
//  ContentView.swift
//  BucketList
//
//  Created by Sam Johnson on 2023-01-07.
//

import SwiftUI

enum LoadingState {
    case loading, success, failure
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    var loadingState = LoadingState.loading
    
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failure:
                FailureView()
            }
        }
        .padding()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
