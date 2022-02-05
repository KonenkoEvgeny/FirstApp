//
//  NewsViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 02.02.2022.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var newsList = [NewsModel]()
    
    func fillNews(){
        let news1 = NewsModel (newsText: "💵 Сколько стоят тестовые задания? Поиск работы — это всегда выполнение многочисленных тестовых заданий. Часто они отнимают очень много времени, сил и ресурсов. Иногда даже подозрительно много. Давайте разбираться, когда можно просить оплату за тестовую задачу и на какую сумму можно рассчитывать. 👉 Все подробности в нашем блоге: http://amp.gs/jmJNB", newsImage: UIImage(named: "newsImageSq")!,avatarImage: UIImage(named: "gbIcon")!,titleLabel: "GeekBrains", subtitleLabel: "1 Feb at 10:30 am")
        let news2 = NewsModel (newsText: "💵 Сколько стоят тестовые задания? Поиск работы — это всегда выполнение многочисленных тестовых заданий. Часто они отнимают очень много времени, сил и ресурсов. Иногда даже подозрительно много. Давайте разбираться, когда можно просить оплату за тестовую задачу и на какую сумму можно рассчитывать. 👉 Все подробности в нашем блоге: http://amp.gs/jmJNB", newsImage: UIImage(named: "newsImageSq")!,avatarImage: UIImage(named: "gbIcon")!,titleLabel: "GeekBrains", subtitleLabel: "1 Feb at 10:30 am")

        newsList.append(news1)
        newsList.append(news2)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: newsTableViewCell, bundle: nil), forCellReuseIdentifier: newsTableViewCellId)
        tableView.delegate = self
        tableView.dataSource = self
        fillNews()
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCellId , for: indexPath) as? NewsTableViewCell else
        {return UITableViewCell()}
        
        cell.titleLabel.text = newsList[indexPath.row].titleLabel
        cell.subtitleLabel.text = newsList[indexPath.row].subtitleLabel
        cell.subtitleLabel.textColor = UIColor.gray.withAlphaComponent(0.5)
        cell.newsTextLabel.text = newsList[indexPath.row].newsText
        cell.newsTextLabel.numberOfLines = 0
        cell.newsImageView.image = newsList[indexPath.row].newsImage
        cell.avatarImage.image = newsList[indexPath.row].avatarImage
        
        return cell
    }
    }
