//
//  ApplicationViewModel.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import Foundation

class ApplicationViewModel: ObservableObject {
    @Published var authenticationResponse: AuthenticationResponse?
    @Published var errorMessage: String?
    
    @Published var phoneNumber: String = ""
    @Published var countryCode: String = "+91"
    
    @Published var isLoading: Bool = false
    @Published var isErrorPresented: Bool = false
    @Published var navigateToOTPView: Bool = false
    @Published var navigateToHomeView: Bool = false
    
    @Published var notesData: Notes?
    
    func sendPhoneNumber(_ phoneNumber: String) {
        isLoading = true
        authenticationResponse = nil
        errorMessage = nil
        
        let requestData = PhoneNumberRequest(number: phoneNumber)
        APIServices.shared.sendRequest(urlString: "https://app.aisle.co/V1/users/phone_number_login", requestBody: requestData, responseType: AuthenticationResponse.self, completion: { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.authenticationResponse = response
                    if let status = response.status, status == true {
                        self?.navigateToOTPView = true
                    } else {
                        self?.errorMessage = "Number not registered"
                        self?.isErrorPresented = true
                    }
                case .failure(let error):
                    self?.errorMessage = "Failed to send phone number: \(error.localizedDescription)"
                }
            }
        })
    }
    
    func sendOTP(_ phoneNumber: String, _ otp: String) {
        isLoading = true
        authenticationResponse = nil
        errorMessage = nil
        
        let requestData = PhoneNumberWithOTPRequest(number: phoneNumber, otp: otp)
        
        APIServices.shared.sendRequest(
            urlString: "https://app.aisle.co/V1/users/verify_otp",
            requestBody: requestData,
            responseType: AuthenticationResponse.self,
            completion: { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        self?.authenticationResponse = response
                        if let token = response.token, !token.isEmpty {
                            self?.fetchNotesData(bearerToken: token, completion: { result, error  in
                                DispatchQueue.main.async {
                                    self?.notesData = result
                                    self?.navigateToHomeView = true
                                    self?.isLoading = false
                                }
                            })
                        } else {
                            self?.errorMessage = "Enter valid OTP"
                            self?.isErrorPresented = true
                            self?.isLoading = false
                        }
                    case .failure(let error):
                        self?.errorMessage = "Failed to verify OTP: \(error.localizedDescription)"
                        self?.isErrorPresented = true
                        self?.isLoading = false
                    }
                }
            })
    }
    
    
    func fetchNotesData(bearerToken: String, completion: @escaping (Notes?, Error?) -> Void) {
        APIServices.shared.fetchNotesData(bearerToken: bearerToken){ result in
            switch result {
            case .success(let notes):
                print("Notes fetched successfully: \(notes)")
                completion(notes, nil)
            case .failure(let error):
                print("Failed to fetch notes: \(error)")
                completion(nil, error)
            }
        }
    }
}
