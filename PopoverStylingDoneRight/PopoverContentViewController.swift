//
//  PopoverContentViewController.swift
//  PopoverStylingDoneRight
//
//  Created by Daniel Yount on 2/12/20.
//  Copyright © 2020 Daniel Yount. All rights reserved.
//

import UIKit

class PopoverContentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleViewForNormalPresentation() // We don’t have enough context to decide whether we are being presented in a popover at this point, so we default to normal appearance. We will have another opportunity to update the view's appearance later.
        
        popoverPresentationController?.delegate = self // You must set the popover presentation delegate or the delegate callback methods (i.e. `prepareForPopoverPresentation` are not called
    }
}

extension PopoverContentViewController: UIPopoverPresentationControllerDelegate {
    
    /// The view has been been initially presented as a `popover`. Note: This delegate callback is not called more than once in the view's lifecycle. It is essentially `viewWillAppear` for popovers.
    /// Do any popover specific styling here. Make sure to override any styles that are applied when you initially style the view for normal presentation as well.
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        styleViewForPopoverPresentation()
    }
    
    /// The view has transitioned from one adaptiveStyle to another. This is your chance to react and style the view based on transitioning between `.popover `<-> `.modal`
    func presentationController(_ presentationController: UIPresentationController, willPresentWithAdaptiveStyle style: UIModalPresentationStyle, transitionCoordinator: UIViewControllerTransitionCoordinator?) {
        switch style {
        case .popover:
            styleViewForPopoverPresentation() // The view will be re-presented as a `.popover` style. Use this point to restyle the view for presentation in a popover
        default:
            styleViewForNormalPresentation() // The view will be re-presented as a non popover style. Use this point ot restyle the view for presentation in a modal
        }
    }
    
    private func styleViewForNormalPresentation() {
        view.backgroundColor = .red
    }
    private func styleViewForPopoverPresentation() {
        view.backgroundColor = .blue
    }
}
