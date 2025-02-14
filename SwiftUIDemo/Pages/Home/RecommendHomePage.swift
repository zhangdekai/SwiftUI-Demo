//
//  RecommendHomePage.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/10.
//

import SwiftUI


#Preview {
    RecommendHomePage()
}


struct RecommendHomePage: View {
    @State private var selectedTab = 0
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            
            // 搜索栏
            SearchBar(searchText: $searchText)
            
            // 分类标签
            TabBar(selectedTab: $selectedTab)
            
            // 切换不同的页面内容
            TabContentView(selectedTab: $selectedTab)
            
        }
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search by name, ID or keyword", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Image(systemName: "calendar")
                .padding()
        }
        .padding()
    }
}

struct TabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 5) {
                HStack(spacing: 20) {
                    ForEach(0..<tabTitles.count, id: \.self) { index in
                        VStack {
                            Button(action: { selectedTab = index }) {
                                Text(tabTitles[index])
                                    .fontWeight(selectedTab == index ? .bold : .regular)
                                    .foregroundColor(selectedTab == index ? .black : .gray)
                            }
                            
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(selectedTab == index ? .black : .clear)
                                .frame(width: 40)
                            
                            //                                .offset(x: CGFloat(selectedTab) * 60 - 120)
                                .animation(.easeInOut, value: selectedTab)
                                .padding(.horizontal) // 让指示器也居中
                        }
                    }
                }
                .frame(maxWidth: .infinity)  // 使HStack水平居中
                
        
            }
            .padding(.horizontal)
        }
    }
}


struct TabContentView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<tabContents.count, id: \.self) { index in
                CharacterListView(characters: tabContents[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}


struct CharacterListView: View {
    let characters: [AICharacter]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(characters) { character in
                    CharacterCard(character: character)
                }
            }
            .padding()
        }
    }
}

struct CharacterCard: View {
    let character: AICharacter
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(character.imageName)
                .resizable()
                .aspectRatio(9/14,contentMode: .fit)
                .cornerRadius(12)
            
            HStack {
                VStack(alignment: .leading,spacing: 5) {
                    Text(character.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(character.description)
                        .font(.subheadline)
                        .italic()
                        .lineLimit(1)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                .frame(maxWidth: .infinity)// 横向铺满父级
                .background(Color.black.opacity(0.5))
                .clipShape(RoundedCorners(bl: 12,br: 12))
        }
    }
}

struct AICharacter: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

// 示例数据
let tabTitles = ["Reommand", "Test1231", "打标", "UGC专测", "🥰 Real"]

let tabContents: [[AICharacter]] = [
    sampleCharacters,
    testCharacters,
    [AICharacter(name: "Alice", description: "Smart and adventurous", imageName: "icybay")],
    [AICharacter(name: "Bob", description: "Curious and energetic", imageName: "lakemcdonald")],
    [AICharacter(name: "Charlie", description: "Kind and wise", imageName: "lakemcdonald")]
]

let sampleCharacters = [
    AICharacter(name: "Jake", description: "bad boy secret softy", imageName: "chincoteague"),
    AICharacter(name: "Tedt", description: "quirky and playful streamer", imageName: "icybay"),
    AICharacter(name: "Samantha Summer", description: "Sizzling hot lifeguard", imageName: "lakemcdonald"),
    AICharacter(name: "Ava Smith", description: "cheerful and flirty girl", imageName: "lakemcdonald")
]

let testCharacters = [
    AICharacter(name: "Barbie", description: "Elegant and stylish", imageName: "lakemcdonald"),
    AICharacter(name: "Kakashi Hatake11", description: "Meet Kanroji Mitsuri, the Love Pillar", imageName: "lakemcdonald")
]

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendHomePage()
//    }
//}

