//
//  SongsRestApi.swift
//  SunoCoding
//
//  Created by Sergii D on 2/20/25.
//
import Foundation

enum SongsRestApiError: Error {
    case badHTTPResponse
    case badJSONData
}

public final class SongsRestApi {
    func fetchSongsFeed(from url: URL) async throws -> SongsFeed {
        let (jsonData, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw SongsRestApiError.badHTTPResponse
        }
        return try JSONDecoder().decode(SongsFeed.self, from: jsonData)
    }
}

 
