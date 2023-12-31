//
//  BaseAPI.swift
//  AflamKo
//
//  Created by MAC on 05/12/2023.
//

import Foundation
import Alamofire

class BaseAPI<T:TargetType>{
    
    func fetchData< M: Decodable>(target : T,responseClass:M.Type , complition : @escaping (M?,Error?) ->()){
        let method = Alamofire.HTTPMethod(rawValue: target.httpMethod.rawValue)
        let params = buildHeadersParams(task: target.task)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        AF.request(target.baseURL + target.endPoint,method: method,parameters: params.0, encoding: params.1,headers: headers)
            .responseDecodable(of: M.self){ response in
                switch response.result{
                case .success(let data):
                    complition(data,nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    complition(nil,error)
                }
            }
    }
    
    private func buildHeadersParams(task:Task) -> ([String:Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestWithParameters(parameters: let parameters, encoding: let encoding):
            return (parameters , encoding)
        }
    }
}
