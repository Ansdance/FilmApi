////
////  sssssssss.swift
////  FilmApi
////
////  Created by ANSAR DAULETBAYEV on 15.02.2023.
////
//
//import Foundation
//Чтобы создать Coordinator для MainPageViewController, вы можете создать новый класс, который реализует протокол Coordinator, и добавить методы, которые отвечают за навигацию на экранах, связанных с MainPageViewController.
//
//Как для любого другого экрана, координатор будет иметь доступ к navigationController, который можно использовать для навигации на других экранах.
//
//Для коллекции, содержащей две разные ячейки, вы можете создать протоколы для каждой ячейки, и каждый ViewModel будет реализовывать соответствующий протокол. Затем вы можете использовать делегаты для передачи событий от ячеек к ViewModel, а ViewModel должен быть связан с соответствующим экземпляром ячейки через аналогичный протокол.
//
//Примерный код Coordinator для MainPageViewController:
//
//swift
//Copy code
//protocol MainPageCoordinatorDelegate: AnyObject {
//    func didSelectMovie(_ movie: Movie)
//    func didSelectSerial(_ serial: Serial)
//}
//
//class MainPageCoordinator: Coordinator {
//    weak var navigationController: UINavigationController?
//    weak var delegate: MainPageCoordinatorDelegate?
//
//    func start() {
//        let viewController = MainPageViewController()
//        let viewModel = MainPageViewModel()
//        viewModel.coordinator = self
//        viewController.viewModel = viewModel
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//
//    func showMovieDetail(for movie: Movie) {
//        delegate?.didSelectMovie(movie)
//    }
//
//    func showSerialDetail(for serial: Serial) {
//        delegate?.didSelectSerial(serial)
//    }
//}
//Примерный код протоколов для ячеек:
//
//swift
//Copy code
//protocol MoviesCollectionViewCellDelegate: AnyObject {
//    func didSelect(movie: Movie)
//}
//
//protocol SerialsCollectionViewCellDelegate: AnyObject {
//    func didSelect(serial: Serial)
//}
//Примерный код ViewModel для MainPageViewController:
//
//swift
//Copy code
//class MainPageViewModel {
//    weak var coordinator: MainPageCoordinator?
//    weak var delegate: MainPageViewModelDelegate?
//    weak var moviesCollectionViewCellDelegate: MoviesCollectionViewCellDelegate?
//    weak var serialsCollectionViewCellDelegate: SerialsCollectionViewCellDelegate?
//
//    var movies: [Movie] = []
//    var serials: [Serial] = []
//
//    func showMovieDetail(for movie: Movie) {
//        coordinator?.showMovieDetail(for: movie)
//    }
//
//    func showSerialDetail(for serial: Serial) {
//        coordinator?.showSerialDetail(for: serial)
//    }
//}
//Примерный код для ячеек MoviesCollectionViewCell и SerialsCollectionViewCell:
//
//csharp
//Copy code
//class MoviesCollectionViewCell: UICollectionViewCell {
//    weak var delegate: MoviesCollectionViewCellDelegate?
//
//    func didSelect() {
//        delegate?.didSelect(movie: movie)
//    }
//}
//
//class SerialsCollectionViewCell: UICollectionViewCell {
//    weak var delegate: SerialsCollectionViewCellDelegate?
//
//    func didSelect() {
//        delegate?.didSelect(serial: serial)
//    }
//}
