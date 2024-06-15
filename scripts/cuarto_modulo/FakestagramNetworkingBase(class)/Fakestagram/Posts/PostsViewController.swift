//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class PostsViewController: UITableViewController {
    
    private var postsModel = PostsModel()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tabBarItem.image = UIImage(systemName: "text.viewfinder")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Post"
        postsModel.getPost{ [weak self] error in
            DispatchQueue.main.async {
                if let error {
                    self?.presentErrorAlert(title: "Error", message: error.localizedDescription)
                }else{
                    self?.tableView.reloadData()
                }
            }
            
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SubtitleCell")
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}

extension PostsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.name, for: indexPath) as? PhotoCell,
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleCell", for: indexPath)
        guard let post = postsModel.post(for: indexPath.section) else { return UITableViewCell () }
        
        var content = cell.defaultContentConfiguration()
        content.text = post.title
        content.secondaryText = post.body
        
        cell.contentConfiguration = content
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        postsModel.getNumberOfPosts()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
}
