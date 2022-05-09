//
//  CardItem.swift
//  shout
//
//  Created by Zachary Fertig on 4/22/22.
//

import Foundation

struct CardItem: Identifiable {
	var id: UUID
	var category: String
}

struct FlashcardItem: Identifiable {
	var id: UUID
	var title: String
	var definition: String
}

func getDocumentsDiretory() -> URL {
 let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
 return paths[0]
}
