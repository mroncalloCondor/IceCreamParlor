//
//  WelcomeViewController.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

final class WelcomeViewController: UIViewController, NVActivityIndicatorViewable {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var orderItemsButton: UIButton!
    var getIngredientsInteractor: SingleInteractor<[Ingredient], Any>!
    
    lazy var presenter: WelcomeViewPresenterType =
        WelcomePresenter(
            with: self,
            getIngredientsInteractor: self.getIngredientsInteractor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupView()
        presenter.didFinishLoadingView()
    }
    
    @IBAction func orderItemsAction(_ sender: UIButton) {
        print("Navigate to new view")
    }
    
    private func updateButtonText() {
        orderItemsButton.setTitle("Order \(presenter.getOrderItemsCount()) items", for: .normal)
    }
    
    private func setupView() {
        self.navigationItem.title = "Welcome"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor.from(hex: "#7FD0D3")
        updateButtonText()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: IngredientCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: IngredientCollectionViewCell.self))
    }
}

extension WelcomeViewController: WelcomeViewControllerType {
    
    func setLoading() {
        self.startAnimating()
    }
    
    func finishLoading() {
        DispatchQueue.main.async {
            self.stopAnimating()
            self.collectionView.reloadData()
        }
    }
}

extension WelcomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getIngredientsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: IngredientCollectionViewCell.self), for: indexPath) as! IngredientCollectionViewCell
        
        cell.setup(ingredient: presenter.getIngredient(for: indexPath.row))
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate protocol conformance
extension WelcomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.ingredientSelected(at: indexPath.row)
        updateButtonText()
    }
}


//MARK: - UICollectionViewDelegateFlowLayout protocol conformance

extension WelcomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 2, right: 2)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        
        return CGSize(width:(self.collectionView.frame.size.width - 10)/2,height: (self.collectionView.frame.size.height)/2)
    }
}
