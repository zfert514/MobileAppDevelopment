//
//  NewFlashcardView.swift
//  shout
//
//  Created by Zachary Fertig on 4/22/22.
//

import SwiftUI
import DesignSystem

struct NewFlashcardView: View {
	@State var items: [FlashcardItem]
	@State var listText = ""
		
	var body: some View {
		NavigationView{
			VStack{
				Text(listText)
				List {
				ForEach($items) { item in
					TextField("Title", text: item.title)
					TextField("Definition", text: item.definition)
					
				}
				.onMove { indexSet, offset in
					items.move(fromOffsets: indexSet, toOffset: offset)
				}
				.onDelete { indexSet in
					items.remove(atOffsets: indexSet)
				}
				}
				Button(action: {
					self.items.append(FlashcardItem(id: UUID(), title: "", definition: ""))
					listText = "\(items.count)"
				}) {
					Text("Add Set")
						.frame(minWidth: 200)
						.padding(.vertical, 5)
						.foregroundColor(.white)
						.background(Color.green)
						.cornerRadius(20)
				}
				Button(action: {
					listText = ""
					for item in items {
						listText = listText + "," + item.title
					}
				}) {
					Text("Done")
						.frame(minWidth: 200)
						.padding(.vertical, 5)
						.foregroundColor(.white)
						.background(Color.green)
						.cornerRadius(20)
				}
			}
			.navigationBarBackButtonHidden(true)
			.toolbar { EditButton() }
		}
	}
}

struct NewFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
		NewFlashcardView(items: [FlashcardItem(id: UUID(), title: "", definition: "")])
    }
}
