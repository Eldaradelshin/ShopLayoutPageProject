
import UIKit

class ScrollableMainVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priseLabel: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    @IBOutlet weak var charsTV: UITextView!
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    let iPhoneXR = MobilePhone.init(
        name: "iPhone XR Late 2018 128Gb",
        cost: 69990.99,
        photos: [
            UIImage.init(named: "photoXR1")!,
            UIImage.init(named: "photoXR2")!,
            UIImage.init(named: "photoXR3")!,
            UIImage.init(named: "photoXR4")!],
        description: "Apple iPhone XR - прекрасен во всех отношениях. Новый дисплей Liquid Retina - самый продвинутый ЖК‑дисплей. Ещё более быстрый Face ID. Самый мощный и умный процессор iPhone. И потрясающая камера. iPhone XR - воплощение красоты и интеллекта." ,
        info: [
            "Артикул" : "",
            "Тип устройства": "",
            "3G": "",
            "4G": "",
            "тип ОС": "",
            "версия ОС": "",
            "процессор": "",
            "SIM-карты": "",
            
            ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = collectionView.numberOfSections
        nameLabel.text = iPhoneXR.name
        priseLabel.text = "\(iPhoneXR.cost)\u{20BD}"
        descriptionTV.text = iPhoneXR.description
        charsTV.text = "Характеристики\n ОС iPhone iOS 12,\n экран: 4.7, 1334×750,\n процессор: Apple A11 Bionic, + Встроенный сопроцессор движения М11,\n камера: 12Мп,\n GPS, ГЛОНАСС,\n с защитой от пыли и влаги,\n время работы в режиме разговора, до: 14ч,\n встроенная память: 128Гб\n"
        
        buyButton.backgroundColor = .orange
        buyButton.layer.cornerRadius = 5
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor.black.cgColor
        
        saveButton.backgroundColor = .orange
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.black.cgColor
        
    }
}

extension ScrollableMainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return iPhoneXR.photos.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoViewCell
        //cell configure
        let imageToDisplay = iPhoneXR.photos[indexPath.section]
        cell.imageTodisplay.image = imageToDisplay
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }
}
