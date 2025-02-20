//
//  SunoCodingTests.swift
//  SunoCodingTests
//
//  Created by Sergii D on 2/20/25.
//

import Testing
import Foundation
@testable import SunoCoding

struct SunoCodingTests {

    @Test func fetchFeed() async throws {
        let songsFeedRestApi = SongsRestApi()
        let result = try await songsFeedRestApi.fetchSongsFeed(from: URL(string: "https://apitest.suno.com/api/songs")!)
        print(result)
    }

}
