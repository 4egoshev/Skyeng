//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

public typealias ___VARIABLE_productName:identifier___CollectionReusableViewConfigurator = CollectionReusableSupplementaryViewConfigurator<___VARIABLE_productName:identifier___CollectionReusableView, ___VARIABLE_productName:identifier___CollectionReusableViewModelProtocol>

public struct ___VARIABLE_productName:identifier___CollectionReusableViewModel: ___VARIABLE_productName:identifier___CollectionReusableViewModelProtocol {
    
    public var configurator: CollectionReusableSupplementaryViewConfigurable = ___VARIABLE_productName:identifier___CollectionReusableViewConfigurator()
    
    public init() {
        
    }
    
    public func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        .zero
    }
}
