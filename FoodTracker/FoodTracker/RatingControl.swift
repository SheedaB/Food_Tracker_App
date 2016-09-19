//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rasheda Babatunde on 9/15/16.
//  Copyright © 2016 Rasheda Babatunde. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    let spacing = 5
    
    let starCount = 5
    
    
    required init?(coder aDecoder: NSCoder) {
        
        let filledStarImage = UIImage(named: "filledStar")
        
        let emptyStarImage = UIImage(named: "emptyStar")
        
        
        super.init(coder: aDecoder)
        
    for _ in 0..<starCount {
            
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44 ))
        
        button.setImage(emptyStarImage, for: UIControlState())
        
        button.setImage(filledStarImage, for: .selected)
        
        button.setImage(filledStarImage, for: [.highlighted, .selected])
        
        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)),
        
        for: .touchDown)
        
        ratingButtons += [button]
        
        addSubview(button)
        }
    }
    
    
    // MARK: Initialization
    
    
    override func layoutSubviews() {
        
           // Set the button's width and height to a square the size of the frame's height.
        
          let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect (x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        
        for (index, button) in ratingButtons.enumerated() {
            
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            
            button.frame = buttonFrame
        }
        
            updateButtonSelectionStates()
    }
    override var intrinsicContentSize : CGSize {
        
        let buttonSize = Int(frame.size.height)
        
        _ = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: 240, height: 44)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    // MARK Button Action
    
    func ratingButtonTapped(_ button: UIButton) {
        
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    
    func updateButtonSelectionStates() {
        for(index, button) in ratingButtons.enumerated() {
            
            // If the index of a button is less than the rating, that button should be selected.
            
            button.isSelected = index < rating
        }
    }
}
