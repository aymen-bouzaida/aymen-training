//
//  ViewController.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    private let cellID = "MovieTableViewCell"
    private var viewModel = {
        MoviesViewModel()
    }()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initView()
        initViewModel()
        bindTableView()
    }

    func initView(){
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGroupedBackground
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    func initViewModel() {
        viewModel.getMovies()
    }
    
    func bindTableView(){
        moviesTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.movies.bind(to: moviesTableView.rx.items(cellIdentifier: cellID, cellType: MovieTableViewCell.self)){ (_ row, item, cell) in
            cell.cellViewModel = item
        }.disposed(by: disposeBag)
    }
}

extension MoviesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
