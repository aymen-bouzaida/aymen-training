//
//  ViewController.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    private let CELL_ID = "MovieTableViewCell"

    lazy var viewModel = {
        MoviesViewModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initView()
        
        initViewModel()
    }

    func initView(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: CELL_ID)
    }
    
    func initViewModel() {
        // Get employees data
        viewModel.getMovies()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        
        cell.titleLabel.text = "hello there"
        
        cell.selectionStyle = .none
        return cell
    }
}

