//
//  ViewController.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import Kingfisher


class ViewController: UIViewController   {

    let viewModel = ViewControllerModel()
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.estimatedRowHeight = 60
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "Top peliculas"
        
        //TODO: - Registro de celda
        myTableView.register(UINib(nibName: "CusotomCell", bundle: nil), forCellReuseIdentifier: "CusotomCell")

        viewModel.fetchMoviesFromMoviesClient {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CusotomCell", for: indexPath) as! CusotomCell
        configuredCell(cell, forRowAtIndexPath: indexPath)
        return cell
        
    }
    
    func configuredCell(_ cell : CusotomCell, forRowAtIndexPath indexPath: IndexPath){
        let model = viewModel.informationForItemAtIndexPath(indexPath)
        cell.myTitleText.text = model.title
        cell.myCategoriatext.text = model.category
        cell.myDirectortext.text = model.director
        cell.mySummaryText.text = model.summary
        cell.myImageMovie.kf.setImage(with: ImageResource(downloadURL: URL(string: model.image!)!),
                                      placeholder: nil,
                                      options: [.transition(ImageTransition.fade(1))],
                                      progressBlock: nil,
                                      completionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}



