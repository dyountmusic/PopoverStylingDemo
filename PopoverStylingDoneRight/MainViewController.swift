//
//  ViewController.swift
//  PopoverStylingDoneRight
//
//  Created by Daniel Yount on 2/12/20.
//  Copyright © 2020 Daniel Yount. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBAction func presentPopoverButtonPressed(_ sender: UIBarButtonItem) {
        guard let view = self.storyboard?.instantiateViewController(withIdentifier: "popoerContentView") as? PopoverContentViewController else { fatalError() }
        let nav = UINavigationController(rootViewController: view)
        nav.modalPresentationStyle = .popover
        nav.popoverPresentationController?.barButtonItem = sender
        present(nav, animated: true)
    }
}

