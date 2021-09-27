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
    
    var tagNumber = 0
    
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
        scrollableFilterView.items = FilterItemViewModel.identity()
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
        switch filterType {
        case .trendy:
            FilterItemViewModel.trendyFilters { filters in
                self.scrollableFilterView.items = filters
            }
        case .color:
            
            FilterItemViewModel.colorFilters { filters in
                DispatchQueue.main.async {
                    self.scrollableFilterView.items = filters
                }
            }
            
        case .artistic:
            FilterItemViewModel.artisticFilters { filters in
                DispatchQueue.main.async {
                    self.scrollableFilterView.items = filters
                }
            }
            
        case .gradient:
            FilterItemViewModel.gradientFilters { filters in
                DispatchQueue.main.async {
                    self.scrollableFilterView.items = filters
                }
            }
        case .sketch:
            FilterItemViewModel.sketchFilter(completion: { filters in
                DispatchQueue.main.async {
                    self.scrollableFilterView.items = filters
                }
            })
        default:
            break
        }
    }
    
    // MARK: - Actions
    
    @IBAction func navigateToCollage(_ sender: Any) {
        navigateToCollageView()
    }
    
    
}
