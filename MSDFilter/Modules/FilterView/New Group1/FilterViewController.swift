//
//  FilterViewController.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 25/09/2021.
//

import UIKit

enum FilterCategory: Int {
    case trendy = 0
    case color = 1
    case artistic = 2
    case gradient = 3
    case sketch = 4
}

class FilterViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var scrollableFilterView: FilterScrollableView!
    @IBOutlet var filterCategories: [UIButton]!
    
    private var tagNumber = 0
    private var filterItemViewModel = FilterItemViewModel()
    private var operationQueue = OperationQueue()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScrollView()
        updateViewContent()
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        var tagNumber = 0
        filterCategories.forEach { button in
            button.tag = tagNumber
            tagNumber += 1
        }
        filterCategories.forEach  { $0.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside) }
    }
    
    private func initScrollView() {
        filterItemViewModel.trendyFilters { filters in
            DispatchQueue.main.async {
                self.scrollableFilterView.items = filters
            }
        }
    }
    
    private func updateViewContent() {
        scrollableFilterView.didSelectClosure = { index in
            self.imageView.image = self.scrollableFilterView.items[index].image
        }
    }
    
    private func navigateToCollageView() {
        let collageVC = CollageViewController.initFromStoryboard(storyboard: .collage)
        navigationController?.pushViewController(collageVC, animated: true)
    }
    
    @objc func pressed(sender: UIButton!) {
        let filterType = FilterCategory(rawValue: sender.tag)
        
        operationQueue.cancelAllOperations()
        
        switch filterType {
        case .trendy:
            
            operationQueue.addOperation {
                self.filterItemViewModel.trendyFilters { filters in
                    DispatchQueue.main.async {
                        self.scrollableFilterView.items = filters
                    }
                }
            }
        case .color:
            operationQueue.addOperation {
                self.filterItemViewModel.colorFilters { filters in
                    DispatchQueue.main.async {
                        self.scrollableFilterView.items = filters
                    }
                }
            }
            
        case .artistic:
            operationQueue.addOperation {
                self.filterItemViewModel.artisticFilters { filters in
                    DispatchQueue.main.async {
                        self.scrollableFilterView.items = filters
                    }
                }
            }
            
        case .gradient:
            
            operationQueue.addOperation {
                self.filterItemViewModel.gradientFilters { filters in
                    DispatchQueue.main.async {
                        self.scrollableFilterView.items = filters
                    }
                }
            }
            
        case .sketch:
            operationQueue.addOperation {
                self.filterItemViewModel.sketchFilter { filters in
                    DispatchQueue.main.async {
                        self.scrollableFilterView.items = filters
                    }
                }
            }
            
        default:
            break
        }
    }
    
    // MARK: - Actions
    
    @IBAction func navigateToCollage(_ sender: Any) {
        navigateToCollageView()
    }
    
    
}
