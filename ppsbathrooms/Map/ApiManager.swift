//
//  ApiManager.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/18/24.
//

import Foundation

class ApiManager {
    static func fetchData(from url: URL, completion: @escaping (String) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                if let stringData = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        completion(stringData)
                    }
                }
            }
        }
        task.resume()
    }
}
