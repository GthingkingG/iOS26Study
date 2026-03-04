//
//  ContentView.swift
//  Week1_concepts
//
//  Created by One on 2/6/26.
//

import SwiftUI

struct ContentView: View {
    @State var planeStatus: Bool = false
    @State var navigationStatus: Bool = false
    
    var titleCaption: AttributedString {
        var string = AttributedString("이 iPone은 포항공과대학교의 감독 및 관리를 받는 기기입니다. 기기감독에 관하여 더 알아보기...")
        if let this = string.range(of: "기기감독에 관하여 더 알아보기...") {
            string[this].foregroundColor = .blue
        }
        string.font = .caption
    
        return string
    }

    var body: some View {
        NavigationStack {
            Form{
                Text(titleCaption)
                    .listRowBackground(Color(.systemGroupedBackground))
                    .background(Color(.systemGroupedBackground))
                
                Section {
                    HStack {
                        Image(systemName: "circle")
                        VStack(alignment: .leading) {
                            Text("김동민")
                                .font(.headline)
                            Text("Apple 계정, iCloud+ 등")
                                .font(.caption)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                
//                Section {
//                    HStack {
//                        ImageChip(name: "airplane", color: .orange)
//                        Text("에어플레인 모드")
//                            .font(.body)
//                        Spacer()
//                        Toggle("", isOn: $planeStatus)
//                    }
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "Wi-Fi", imageName:"wifi", subTitle: "연결 안 됨", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "Bluetooth", imageName: "bonjour", subTitle: "켬", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "셀룰러", imageName: "antenna.radiowaves.left.and.right", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "개인용 핫스팟", imageName: "personalhotspot", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "배터리", imageName: "battery.100percent", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        ContentUnavailableView {
//                            Label("No Contents", systemImage: "tray.fill")
//                        } description: {
//                            Text("New mails you receive will appear here.")
//                        }
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "VPN", imageName: "globe", subTitle: "연결 안 됨", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                }
                
//                Section {
//                    HStack {
//                        ImageChip(name: "airplane", color: .orange)
//                        Text("에어플레인 모드")
//                            .font(.body)
//                        Spacer()
//                        Toggle("", isOn: $planeStatus)
//                    }
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "Wi-Fi", imageName:"wifi", subTitle: "연결 안 됨", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "Bluetooth", imageName: "bonjour", subTitle: "켬", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "셀룰러", imageName: "antenna.radiowaves.left.and.right", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "개인용 핫스팟", imageName: "personalhotspot", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "배터리", imageName: "battery.100percent", backColor: .green)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        ContentUnavailableView {
//                            Label("No Contents", systemImage: "tray.fill")
//                        } description: {
//                            Text("New mails you receive will appear here.")
//                        }
//                    })
//                    
//                    Button(action: {
//                        navigationStatus.toggle()
//                    }, label: {
//                        ListView(title: "VPN", imageName: "globe", subTitle: "연결 안 됨", backColor: .blue)
//                    })
//                    .navigationDestination(isPresented: $navigationStatus, destination: {
//                        Text("temp")
//                            .backgroundStyle(Color(.systemGroupedBackground))
//                    })
//                }
            }
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

#Preview {
    ContentView()
}

/*
 
 
 //
 //  ContentView.swift
 //  iOS26Study
 //
 //  Created by One on 2/6/26.
 //

 import SwiftUI

 struct ContentView: View {
     @State var planeStatus: Bool = false
     @State var navigationStatus: Bool = false
     var body: some View {
         NavigationStack {
             
             Form{
                 formSection(type: .first)
                 
             }
             .navigationTitle("설정")
             .navigationBarTitleDisplayMode(.large)
         }
         }
         
         private func formSection(type: SectionType) -> some View {
             switch type {
             case .first:
                 <#code#>
             case .second:
                 <#code#>
             case .third:
                 <#code#>
             }
         }

     }
 }

 fileprivate struct SecondSection: View {
     
     
     var body: some View {
         Section(content: {
             Text("!1")
         })
     }
 }
 //        Section {
 //            HStack {
 //                ImageChip(name: "airplane", color: .orange)
 //                Text("에어플레인 모드")
 //                    .font(.body)
 //                Spacer()
 //                Toggle("", isOn: $planeStatus)
 //            }
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "Wi-Fi", imageName:"wifi", subTitle: "연결 안 됨", backColor: .blue)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                Text("temp")
 //                    .backgroundStyle(Color(.systemGroupedBackground))
 //            })
 //
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "Bluetooth", imageName: "bonjour", subTitle: "켬", backColor: .blue)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                Text("temp")
 //                    .backgroundStyle(Color(.systemGroupedBackground))
 //            })
 //
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "셀룰러", imageName: "antenna.radiowaves.left.and.right", backColor: .green)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                Text("temp")
 //                    .backgroundStyle(Color(.systemGroupedBackground))
 //            })
 //
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "개인용 핫스팟", imageName: "personalhotspot", backColor: .green)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                Text("temp")
 //                    .backgroundStyle(Color(.systemGroupedBackground))
 //            })
 //
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "배터리", imageName: "battery.100percent", backColor: .green)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                ContentUnavailableView {
 //                    Label("No Contents", systemImage: "tray.fill")
 //                } description: {
 //                    Text("New Contents you receive will appear here.")
 //                }
 //            })
 //
 //            Button(action: {
 //                navigationStatus.toggle()
 //            }, label: {
 //                ListView(title: "VPN", imageName: "globe", subTitle: "연결 안 됨", backColor: .blue)
 //            })
 //            .navigationDestination(isPresented: $navigationStatus, destination: {
 //                Text("temp")
 //                    .backgroundStyle(Color(.systemGroupedBackground))
 //            })
 //
 //
 //
 //
 //
 //
 //        }
     }
 }

 #Preview {
     ContentView()
 }

 
 
 */
