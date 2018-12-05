//
//  EmojiLabel.swift
//  CoffeePizzaWillowTree
//
//  Created by TJ Barber on 12/5/18.
//  Copyright © 2018 TJ Barber. All rights reserved.
//

import AppKit

final class EmojiLabel: NSTextField {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
}

private extension EmojiLabel {
    func configure() {
        isBezeled = false
        isSelectable = false
        drawsBackground = false
    }
}
