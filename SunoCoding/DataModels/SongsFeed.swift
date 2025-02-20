//
//  Song.swift
//  SunoCoding
//
//  Created by Sergii D on 2/20/25.
//
import Foundation

struct SongsFeed: Codable {
    let end = 0, page = 0, perPage = 0
    var songs: [Song]
    let start = 0 , totalPages = 0, totalSongs = 0
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    enum CodingKeys: String, CodingKey {
        case end, page
        case perPage = "per_page"
        case songs, start
        case totalPages = "total_pages"
        case totalSongs = "total_songs"
    }
}

// MARK: - Song
struct Song: Codable {
    let createdAt = "", displayName: String, handle = "", id: String
    let imageLargeURL = "", imageURL: String
    
    init(id: String = UUID().uuidString, displayName: String, imageURL: String) {
        self.id = id
        self.displayName = displayName
        self.imageURL = imageURL
    }
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case displayName = "display_name"
        case handle, id
        case imageLargeURL = "image_large_url"
        case imageURL = "image_url"
    }
}

extension Song: Identifiable {}

// MARK: - Metadata
struct Metadata: Codable {
    let audioPromptID: JSONNull?
    let concatHistory: [ConcatHistory]
    let duration: Double
    let errorMessage, errorType, gptDescriptionPrompt, hasVocal: JSONNull?
    let history, infill, isAudioUploadTosAccepted: JSONNull?
    let prompt: String
    let refundCredits, stream: JSONNull?
    let tags, type: String

    enum CodingKeys: String, CodingKey {
        case audioPromptID = "audio_prompt_id"
        case concatHistory = "concat_history"
        case duration
        case errorMessage = "error_message"
        case errorType = "error_type"
        case gptDescriptionPrompt = "gpt_description_prompt"
        case hasVocal = "has_vocal"
        case history, infill
        case isAudioUploadTosAccepted = "is_audio_upload_tos_accepted"
        case prompt
        case refundCredits = "refund_credits"
        case stream, tags, type
    }
}

// MARK: - ConcatHistory
struct ConcatHistory: Codable {
    let continueAt: Int?
    let id: String

    enum CodingKeys: String, CodingKey {
        case continueAt = "continue_at"
        case id
    }
}

// MARK: - Reaction
struct Reaction: Codable {
    let clip: String
    let flagged: Bool
    let flaggedReason: JSONNull?
    let playCount: Int
    let reactionType: String
    let skipCount: Int
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case clip, flagged
        case flaggedReason = "flagged_reason"
        case playCount = "play_count"
        case reactionType = "reaction_type"
        case skipCount = "skip_count"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
