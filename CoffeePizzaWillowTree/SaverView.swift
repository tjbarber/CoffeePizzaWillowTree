//
//  SaverView.swift
//  CoffeePizzaWillowTree
//
//  Created by TJ Barber on 12/5/18.
//  Copyright © 2018 TJ Barber. All rights reserved.
//

import ScreenSaver

enum SaverViewImageType: String {
    case coffee = "☕"
    case pizza = "🍕"
    case willowtree = "wt_logo"
}

// MARK: - SaverView
final class SaverView: ScreenSaverView {
    var  nextScreen: SaverViewImageType = .coffee
    
    private let emojiLabel: EmojiLabel = {
        let label = EmojiLabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let imageView: NSImageView = {
        // Force unwrapping this because if we don't have an image we might as well crash
        let imagePath = Bundle(for: SaverView.self).path(forResource: SaverViewImageType.willowtree.rawValue, ofType: "png")!
        let image = NSImage(byReferencingFile: imagePath)!
        let imageView = NSImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = NSRect(x: 0, y: 0, width: 400.0, height: 400.0)
        imageView.isHidden = true
        return imageView
    }()

    // MARK: - Initialization
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        configure()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        configure()
    }
}

// MARK: - Lifecycle
extension SaverView {
    override func animateOneFrame() {
        super.animateOneFrame()
        
        updateContent()
    }
}

// MARK: - Configuration
private extension SaverView {
    func configure() {
        animationTimeInterval = 3
        
        addSubviews()
        defineConstraints()
        setupSubviews()
    }
    
    func addSubviews() {
        addSubview(emojiLabel)
        addSubview(imageView)
    }
    
    func defineConstraints() {
        emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setupSubviews() {
        emojiLabel.font = NSFont.systemFont(ofSize: bounds.height / 5)
    }
}

// MARK: - On Update
private extension SaverView {
    func updateContent() {
        switch nextScreen {
        case .coffee:
            emojiLabel.stringValue = SaverViewImageType.coffee.rawValue
            emojiLabel.isHidden = false
            imageView.isHidden = true
            nextScreen = .pizza
        case .pizza:
            emojiLabel.stringValue = SaverViewImageType.pizza.rawValue
            nextScreen = .willowtree
        case .willowtree:
            print("hi")
            emojiLabel.isHidden = true
            imageView.isHidden = false
            
            nextScreen = .coffee
        }
    }
}

