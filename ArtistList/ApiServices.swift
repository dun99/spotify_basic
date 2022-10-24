//
//  ApiServices.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 18/10/2022.
//

import UIKit

class ApiServices {

    func fetchingApiData<T: Decodable>(for: T.Type = T.self, URL url: String,
                                               completion: @escaping (T)-> Void) {
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        let token = Constants.token
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error != nil {
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print("data\(dataString)")
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion((jsonData))
                }
            } catch {
                print("Parse error")
            }
        }
        dataTask.resume()
    }
    
    func getImageDataForm(url: URL, completion: @escaping (UIImage)-> Void) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error != nil {
                return
            }

            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(image)
                }
            }
        }.resume()
    }

}
