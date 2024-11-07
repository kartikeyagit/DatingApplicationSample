//
//  NotesView.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import SwiftUI

struct NotesView: View {
    @State var viewModel: ApplicationViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Notes")
                        .font(.custom("Gilroy-Bold", size: 20))
                        .foregroundStyle(.black)
                    Text("Personal messages to you")
                        .font(.custom("Gilroy-Medium", size: 16))
                        .padding(.top, 4.5)
                        .foregroundStyle(.black)
                    ZStack {
                        
                        AsyncImage(url: URL(string: viewModel.notesData?.invites.profiles.first?.photos.first?.photo ?? "")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 344)
                                    .cornerRadius(8)
                            } else if phase.error != nil {
                                Text("No image available")
                                    .frame(height: 344)
                                    .cornerRadius(8)
                            } else {
                                ProgressView()
                                    .frame(height: 344)
                                    .cornerRadius(8)
                            }
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(viewModel.notesData?.invites.profiles.first?.generalInformation.firstName ?? ""), \(Int(viewModel.notesData?.invites.profiles.first?.generalInformation.age ?? 0))")
                                        .font(.custom("Gilroy-Bold", size: 22))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                    
                                    Text("Tap to review 50+ notes")
                                        .font(.custom("Gilroy-Medium", size: 15))
                                        .foregroundStyle(.white)
                                }
                                .padding(8)
                                .padding([.bottom, .trailing], 8)
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 2.5)
                    
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2.5) {
                            Text("Interested in you")
                                .font(.custom("Gilroy-Bold", size: 21))
                                .foregroundStyle(.black)
                            
                            Text("Premium members can view all their likes at once")
                                .font(.custom("Filroy-Medium", size: 14.5))
                                .foregroundStyle(.gray)
                        }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "F9CB10"))
                            .frame(width: 96, height: 60)
                            .overlay {
                                Text("Upgrade")
                                    .font(.custom("Gilroy-Bold", size: 14))
                                    .foregroundStyle(.black)
                            }
                        
                    }
                    .padding(.top)
                    
                    // Can see profile -> false
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.notesData?.likes.profiles ?? [], id: \.self) { profile in
                            ZStack {
                                AsyncImage(url: URL(string: profile.avatar)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 255)
                                            .cornerRadius(8)
                                            .blur(radius: 12)
                                    } else if phase.error != nil {
                                        Text("No image available")
                                            .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 255)
                                            .cornerRadius(8)
                                    } else {
                                        ProgressView()
                                            .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 255)
                                            .cornerRadius(8)
                                    }
                                }
                                .cornerRadius(8)
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text(profile.firstName)
                                            .font(.custom("Gilroy-Bold", size: 22))
                                            .foregroundColor(.white)
                                            .padding(8)
                                            .cornerRadius(8)
                                            .padding([.bottom, .trailing], 8)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .padding(5)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NotesView(viewModel: ApplicationViewModel())
}
