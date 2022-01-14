//
//  NetworkingManager.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()

    private init() {}
    
    func fetchData(completion: @escaping (_ users: [User]) -> Void) {
        let jsonPath = Bundle.main.path(forResource: "generated", ofType: "json")
        guard let path = jsonPath else { return }
        let jsonURL = URL(fileURLWithPath: path)
        let jsonData = try? Data(contentsOf: jsonURL)
        guard let data = jsonData else { return }

        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            DispatchQueue.main.async {
                completion(users)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
