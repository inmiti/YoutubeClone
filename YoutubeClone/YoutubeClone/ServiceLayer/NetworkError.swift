//
//  NetworkError.swift
//  YoutubeClone
//
//  Created by ibautista on 30/1/24.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Ocurrió un error al tratar de consultar la API: Status Code"
    case jsonDecoder = "Error al intentar extraer datos de json"
    case unauthorized
}
