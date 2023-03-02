////
////  dddddddd.swift
////  FilmApi
////
////  Created by ANSAR DAULETBAYEV on 15.02.2023.
////
//Для реализации координатора для MainPageViewController вам необходимо сначала создать протоколы, которые будут описывать взаимодействие между координатором и представлениями MoviesCollectionViewCell и SerialsCollectionViewCell. Вот как можно описать эти протоколы:
//
//swift
//Copy code
//protocol MoviesCollectionViewDelegate: AnyObject {
//    func didSelectMovie(_ movie: Movie)
//}
//
//protocol SerialsCollectionViewDelegate: AnyObject {
//    func didSelectSerial(_ serial: Serial)
//}
//Затем вы можете создать координатор и реализовать методы, которые будут обрабатывать события взаимодействия в представлениях. Вот как это может выглядеть:
//
//swift
//Copy code
//class MainPageCoordinator: Coordinator {
//    var navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        let mainPageViewController = MainPageViewController()
//        mainPageViewController.coordinator = self
//        navigationController.pushViewController(mainPageViewController, animated: true)
//    }
//
//    func showMovies() {
//        let moviesViewController = MoviesViewController()
//        moviesViewController.delegate = self
//        navigationController.pushViewController(moviesViewController, animated: true)
//    }
//
//    func showSerials() {
//        let serialsViewController = SerialsViewController()
//        serialsViewController.delegate = self
//        navigationController.pushViewController(serialsViewController, animated: true)
//    }
//}
//
//extension MainPageCoordinator: MoviesCollectionViewDelegate {
//    func didSelectMovie(_ movie: Movie) {
//        // Handle movie selection event
//    }
//}
//
//extension MainPageCoordinator: SerialsCollectionViewDelegate {
//    func didSelectSerial(_ serial: Serial) {
//        // Handle serial selection event
//    }
//}
//Затем вам необходимо настроить ваши MoviesViewController и SerialsViewController, чтобы они вызывали методы делегата при выборе пользователем элемента. Вот как это может быть сделано для MoviesViewController:
//
//swift
//Copy code
//class MoviesViewController: UIViewController {
//    weak var delegate: MoviesCollectionViewDelegate?
//
//    // ...
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie = movies[indexPath.row]
//        delegate?.didSelectMovie(movie)
//    }
//
//    // ...
//}
//И аналогичным образом для SerialsViewController:
//
//swift
//Copy code
//class SerialsViewController: UIViewController {
//    weak var delegate: SerialsCollectionViewDelegate?
//
//    // ...
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let serial = serials[indexPath.row]
//        delegate?.didSelectSerial(serial)
//    }
//
//    // ...
//}
//
//


//che za finya
