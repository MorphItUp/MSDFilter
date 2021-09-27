//
//  FilterViewController.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 25/09/2021.
//

import UIKit

class FilterViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var scrollableFilterView: FilterScrollableView!
    
    // MARK: - Private Properties
    
    private var viewModel: FilterViewModel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScrollView()
        updateViewContent()
    }
    
    // MARK: - Private Methods
    
    private func initScrollView() {
        scrollableFilterView.items = FilterItem.identity()
    }
    
    private func updateViewContent() {
        scrollableFilterView.didSelectClosure = { index in
            self.imageView.image = self.scrollableFilterView.items[index].image
        }
    }
    
    // MARK: - Actions
    
    @IBAction func navigateToCollage(_ sender: Any) {
        let collageVC = CollageViewController.initFromStoryboard(storyboard: .collage)
        navigationController?.pushViewController(collageVC, animated: true)
    }
    
    
}
