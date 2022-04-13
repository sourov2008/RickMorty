import UIKit

extension UIViewController
{
    
    @objc
     class func instantiateFromStoryboardMain() -> Self
    {
        let className = String(describing: self)
        let storyboardName =  "\(Storyboards.Main)"
        return instantiateFromStoryboardHelper(storyboardName: storyboardName, storyboardId: className)
    }
    
    
    private class func instantiateFromStoryboardHelper<T>(storyboardName: String, storyboardId: String) -> T
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }
     
}

extension UIViewController
{
    func configureNavigationController(){
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        //appearance.backgroundColor = .white
         
        appearance.backgroundColor =  UIColor.init(red: 84/255, green: 201/255, blue: 179/255, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance

    }
}

extension UIViewController{
    
    
      func showAlertMessage(message:String, title: String) {
        //DispatchQueue.main.async {
            let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
            alertMessage.addAction(cancelAction)
            self.present(alertMessage, animated: true, completion: nil)
        //}
    }
    
    func showOverlayLoader(message:String, title: String)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
}


extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: 16 , y: self.view.frame.size.height-100, width: self.view.frame.size.width - 32 , height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 5;
    toastLabel.clipsToBounds  =  true
    toastLabel.numberOfLines = 0
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 2.0, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
