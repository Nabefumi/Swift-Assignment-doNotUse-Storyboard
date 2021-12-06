//
//  Networking.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-12-03.
//

import Foundation

class Networking {
    
//    static func samplePostapi() {
//        let session = URLSession.shared
//        let url = URL(string: "http://dummy.restapiexample.com/api/v1/create")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        let employee = Employee(id: 1, name: "test")
//
//        request.httpBody = self.serialize(employee: employee)
//
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//
//        session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
//
//
//    }
    
    static func sampleApi() { 
        let session = URLSession.shared
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                // take care of this error
                self.handle(error: error)
            } else {
                if let data = data,
                   let response = response as? HTTPURLResponse,
                   (200...299).contains(response.statusCode) {
                    
                    // we can try to access to json responce
                    let deserialozedResponce = self.deserialize(data: data)
                    
                    print(deserialozedResponce)
                    
                } else {
                    self.handleSeverError(responce: response)
                }
            }
            
        }
        
        task.resume()
    }
    
    static func deserialize(data: Data) -> EmployeeResponce? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(EmployeeResponce.self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func serialize(employee: Employee) -> Data? {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(employee)
        } catch {
            return nil
        }
    }

    static func handleSeverError(responce: URLResponse?) {
        print(responce)
    }
    
    static func handle(error: Error) {
        print(error.localizedDescription)
    }
}
