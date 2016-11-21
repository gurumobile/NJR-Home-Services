//
//  HomeVC.swift
//  NJR Home Services
//
//  Created by Bogdan on 11/18/16.
//  Copyright © 2016 Bogdan. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    
    var isHome = true
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageControl.addTarget(self, action: #selector(HomeVC.didChangePageControlValue), for: .valueChanged)
        
        onBtnInitialize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.alpha = 0.0
        
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(HomeVC.imageSlideAction), userInfo: nil, repeats: true);
        
        mainView.alpha = 1.0
    }
    
    //MARK: - Button Initialize...
    
    func onBtnInitialize() {
        submitBtn.layer.cornerRadius = submitBtn.frame.size.height / 2
        termsBtn.layer.cornerRadius = submitBtn.frame.size.height / 2
        aboutBtn.layer.cornerRadius = submitBtn.frame.size.height / 2
        
        homeBtn.layer.cornerRadius = homeBtn.frame.size.height / 2
        
        onBtnDisplay(isHidden: true)
    }
    
    func onBtnDisplay(isHidden: Bool) {
        submitBtn.isHidden = isHidden
        termsBtn.isHidden = isHidden
        aboutBtn.isHidden = isHidden
    }
    
    //MARK: - PageControl Fire Method...
    
    func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    //MARK: - Image Slide Action...
    
    func imageSlideAction() {
        tutorialPageViewController?.scrollToNextViewController()
    }
    
    //Prepare for segue...
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    //MARK: - Button Actions...
    
    @IBAction func onHome(_ sender: Any) {
        if isHome {
            onBtnDisplay(isHidden: false)
            isHome = false
        } else {
            onBtnDisplay(isHidden: true)
            isHome = true
        }
    }
    
    @IBAction func onSubmit(_ sender: Any) {
    }
    
    @IBAction func onAbout(_ sender: Any) {
    }
    
    @IBAction func onTerms(_ sender: Any) {
    }
    
    //MARK: - Unwind Segue...
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
}

extension HomeVC: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
        
    }
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
