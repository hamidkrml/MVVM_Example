import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // API isteğini gönderme
        fetchRatedMovies()
    }
    
    func fetchRatedMovies() {
       
        
        
        NetworkManeger.shared.request(EndPoint.ratedMovies) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let movieResponse):
               
                print("Veri başarıyla alındı:")
                print("Toplam Sayfa: \(String(describing: movieResponse.page))")
               
                DispatchQueue.main.async {
                }
                
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
            }
        }
    }
}
