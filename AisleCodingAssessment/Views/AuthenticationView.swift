//
//  AuthenticationView.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var viewModel = ApplicationViewModel()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Get OTP")
                    .padding(.top, 50)
                    .font(.custom("Inter-Medium", size: 15))
                    .foregroundStyle(.black)
                
                Text("Enter Your\nPhone Number")
                    .font(.custom("Inter-ExtraBold", size: 30))
                    .padding(.top, 1.5)
                    .foregroundStyle(.black)
                
                HStack {
                    TextField("+91", text: $viewModel.countryCode)
                        .keyboardType(.phonePad)
                        .frame(width: 60)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.black)
                        .frame(height: 40)
                        .cornerRadius(8)
                        .multilineTextAlignment(.center)
                        .font(.custom("Inter-Bold", size: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#C4C4C4"), lineWidth: 1)
                        )
                    
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .keyboardType(.phonePad)
                        .padding(.horizontal)
                        .foregroundStyle(.black)
                        .frame(height: 40)
                        .cornerRadius(8)
                        .font(.custom("Inter-Bold", size: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#C4C4C4"), lineWidth: 1)
                        )
                }
                .padding(.trailing, 50)
                
                if viewModel.isLoading {
                    ProgressView()
                        .tint(Color(hex: "F9CB10"))
                        .padding(.leading)
                        .padding(.top)
                } else {
                    Button {
                        viewModel.sendPhoneNumber(viewModel.countryCode + viewModel.phoneNumber)
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "F9CB10"))
                            .frame(width: 96, height: 40)
                            .overlay {
                                Text("Continue")
                                    .font(.custom("Inter-Bold", size: 14))
                                    .foregroundStyle(.black)
                            }
                    }
                    .padding(.top)
                }
                Spacer()
            }
            .padding()
            .padding(.leading)
            
        }
        .navigationDestination(isPresented: $viewModel.navigateToOTPView) {
            OTPView(viewModel: viewModel).navigationBarHidden(true)
        }
        .alert(isPresented: $viewModel.isErrorPresented) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "An unexpected error occurred"),
                dismissButton: .default(Text("OK")) {
                    viewModel.errorMessage = nil
                }
            )
        }
    }
}
