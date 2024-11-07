//
//  ApplicationModel.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import Foundation

// MARK: - PhoneNumberRequest
struct PhoneNumberRequest: Codable {
    let number: String
}

// MARK: - PhoneNumberWithOTPRequest
struct PhoneNumberWithOTPRequest: Codable {
    let number: String
    let otp: String
}

// MARK: - AuthenticationResponse
struct AuthenticationResponse: Codable {
    let status: Bool?
    let token: String?
}

// MARK: - Notes
struct Notes: Codable, Hashable {
    let invites: Invites
    let likes: Likes
}

// MARK: - Invites
struct Invites: Codable, Hashable {
    let profiles: [InvitesProfile]
    let totalPages: Int
    let pendingInvitationsCount: Int

    enum CodingKeys: String, CodingKey {
        case profiles, totalPages
        case pendingInvitationsCount = "pending_invitations_count"
    }
}

// MARK: - InvitesProfile
struct InvitesProfile: Codable, Hashable {
    let generalInformation: GeneralInformation
    let approvedTime: Double
    let disapprovedTime: Double
    let photos: [Photo]
    let work: Work
    let preferences: [ProfilePreference]
    let instagramImages: String?
    let lastSeenWindow: String
    let isFacebookDataFetched: Bool
    let icebreakers: String?
    let story: String?
    let meetup: String?
    let verificationStatus: String
    let hasActiveSubscription: Bool
    let showConciergeBadge: Bool
    let lat: Double
    let lng: Double
    let lastSeen: String?
    let onlineCode: Int
    let profileDataList: [ProfileDataList]

    enum CodingKeys: String, CodingKey {
        case generalInformation = "general_information"
        case approvedTime = "approved_time"
        case disapprovedTime = "disapproved_time"
        case photos
        case work, preferences
        case instagramImages = "instagram_images"
        case lastSeenWindow = "last_seen_window"
        case isFacebookDataFetched = "is_facebook_data_fetched"
        case icebreakers, story, meetup
        case verificationStatus = "verification_status"
        case hasActiveSubscription = "has_active_subscription"
        case showConciergeBadge = "show_concierge_badge"
        case lat, lng
        case lastSeen = "last_seen"
        case onlineCode = "online_code"
        case profileDataList = "profile_data_list"
    }
}

// MARK: - GeneralInformation
struct GeneralInformation: Codable, Hashable {
    let dateOfBirth: String
    let dateOfBirthV1: String
    let location: Location
    let drinkingV1: DrinkingV1Class
    let firstName: String
    let gender: String
    let maritalStatusV1: MaritalStatusV1Class
    let refID: String
    let smokingV1: DrinkingV1Class
    let sunSignV1: Faith
    let motherTongue: Faith
    let faith: Faith
    let height: Int
    let cast: String?
    let kid: String?
    let diet: String?
    let politics: String?
    let pet: String?
    let settle: String?
    let mbti: String?
    let age: Int

    enum CodingKeys: String, CodingKey {
        case dateOfBirth = "date_of_birth"
        case dateOfBirthV1 = "date_of_birth_v1"
        case location
        case drinkingV1 = "drinking_v1"
        case firstName = "first_name"
        case gender
        case maritalStatusV1 = "marital_status_v1"
        case refID = "ref_id"
        case smokingV1 = "smoking_v1"
        case sunSignV1 = "sun_sign_v1"
        case motherTongue = "mother_tongue"
        case faith, height, cast, kid, diet, politics, pet, settle, mbti, age
    }
}

// MARK: - DrinkingV1Class
struct DrinkingV1Class: Codable, Hashable {
    let id: Int
    let name: String
    let nameAlias: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameAlias = "name_alias"
    }
}

// MARK: - Faith
struct Faith: Codable, Hashable {
    let id: Int
    let name: String
}

// MARK: - Location
struct Location: Codable, Hashable {
    let summary: String
    let full: String
}

// MARK: - MaritalStatusV1Class
struct MaritalStatusV1Class: Codable, Hashable {
    let id: Int
    let name: String
    let preferenceOnly: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case preferenceOnly = "preference_only"
    }
}

// MARK: - Photo
struct Photo: Codable, Hashable {
    let photo: String
    let photoID: Int
    let selected: Bool
    let status: String?

    enum CodingKeys: String, CodingKey {
        case photo
        case photoID = "photo_id"
        case selected, status
    }
}

// MARK: - ProfilePreference
struct ProfilePreference: Codable, Hashable {
    let answerID: Int
    let id: Int
    let value: Int
    let preferenceQuestion: PreferenceQuestion

    enum CodingKeys: String, CodingKey {
        case answerID = "answer_id"
        case id, value
        case preferenceQuestion = "preference_question"
    }
}

// MARK: - PreferenceQuestion
struct PreferenceQuestion: Codable, Hashable {
    let firstChoice: String
    let secondChoice: String

    enum CodingKeys: String, CodingKey {
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - ProfileDataList
struct ProfileDataList: Codable, Hashable {
    let question: String
    let preferences: [ProfileDataListPreference]
    let invitationType: String

    enum CodingKeys: String, CodingKey {
        case question, preferences
        case invitationType = "invitation_type"
    }
}

// MARK: - ProfileDataListPreference
struct ProfileDataListPreference: Codable, Hashable {
    let answerID: Int
    let answer: String
    let firstChoice: String
    let secondChoice: String

    enum CodingKeys: String, CodingKey {
        case answerID = "answer_id"
        case answer
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - Work
struct Work: Codable, Hashable {
    let industryV1: MaritalStatusV1Class
    let monthlyIncomeV1: String?
    let experienceV1: DrinkingV1Class
    let highestQualificationV1: MaritalStatusV1Class
    let fieldOfStudyV1: Faith

    enum CodingKeys: String, CodingKey {
        case industryV1 = "industry_v1"
        case monthlyIncomeV1 = "monthly_income_v1"
        case experienceV1 = "experience_v1"
        case highestQualificationV1 = "highest_qualification_v1"
        case fieldOfStudyV1 = "field_of_study_v1"
    }
}

// MARK: - Likes
struct Likes: Codable, Hashable {
    let profiles: [LikesProfile]
    let canSeeProfile: Bool
    let likesReceivedCount: Int

    enum CodingKeys: String, CodingKey {
        case profiles
        case canSeeProfile = "can_see_profile"
        case likesReceivedCount = "likes_received_count"
    }
}

// MARK: - LikesProfile
struct LikesProfile: Codable, Hashable {
    let firstName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case avatar
    }
}
