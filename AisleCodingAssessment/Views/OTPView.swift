//
//  OTPView.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import SwiftUI

struct OTPView: View {
    @ObservedObject var viewModel: ApplicationViewModel
    @State var otpText: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.countryCode + viewModel.phoneNumber)
                    .font(.custom("Inter-Medium", size: 18))
                Button {
                    viewModel.navigateToOTPView = false
                } label: {
                    Image(systemName: "pencil")
                }
            }
            .padding(.top, 50)
            Text("Enter the\nOTP")
                .font(.custom("Inter-ExtraBold", size: 30))
                .padding(.top, 5)
            
            TextField("OTP", text: $otpText)
                .keyboardType(.phonePad)
                .padding(.horizontal)
                .frame(width: 96, height: 40)
                .cornerRadius(8)
                .font(.custom("Inter-Bold", size: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "#C4C4C4"), lineWidth: 1)
                )
                .padding(.top, 5)
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(Color(hex: "F9CB10"))
                    .padding(.leading)
                    .padding(.top)
            } else {
                Button {
                    viewModel.sendOTP(viewModel.countryCode + viewModel.phoneNumber, otpText)
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationDestination(isPresented: $viewModel.navigateToHomeView) {
            HomeView(viewModel: viewModel).navigationBarHidden(true)
        }
    }
}

#Preview {
    OTPView(viewModel: ApplicationViewModel())
}
