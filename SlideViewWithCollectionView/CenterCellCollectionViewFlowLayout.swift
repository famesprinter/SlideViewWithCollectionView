//
//  CenterCellCollectionViewFlowLayout.swift
//  SlideViewWithCollectionView
//
//  Created by Kittitat Rodphotong on 12/24/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//  Source code ==> cc: http://blog.karmadust.com/centered-paging-with-preview-cells-on-uicollectionview/
//

import UIKit

class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        if let cv = collectionView {
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width/2
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth
            
            if let attributesForVisibleCells = layoutAttributesForElements(in: cvBounds) {
                
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
                    
                    // == Skip comparison with non-cell items (headers and footers) == //
                    if attributes.representedElementCategory != UICollectionElementCategory.cell {
                        continue
                    }

                    if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
                        continue
                    }
                    
                    // == First time in the loop == //
                    guard let candAttrs = candidateAttributes else {
                        candidateAttributes = attributes
                        continue
                    }
                    
                    let a = attributes.center.x - proposedContentOffsetCenterX
                    let b = candAttrs.center.x - proposedContentOffsetCenterX
                    
                    if fabsf(Float(a)) < fabsf(Float(b)) {
                        candidateAttributes = attributes;
                    }
                }
                
                // Beautification step , I don't know why it works!
                if(proposedContentOffset.x == -(cv.contentInset.left)) {
                    return proposedContentOffset
                }
                return CGPoint(x: floor(candidateAttributes!.center.x - halfWidth),
                               y: proposedContentOffset.y)
            }
        }
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
    }
}
