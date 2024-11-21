import UIKit

extension UIButton {
    static func create(withTitle title: String) -> UIButton {
        let button = UIButton()
  
        var configuration = UIButton.Configuration.filled()
        let configurationTitle = title
        let customFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        var attributedTitle: AttributedString?
        do {
            attributedTitle = try AttributedString(configurationTitle, attributes: AttributeContainer([.font: customFont]))
        } catch {
            print("Error creating AttributedString: \(error)")
        }
        if let attributedTitle = attributedTitle {
            configuration.attributedTitle = attributedTitle
        }
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let operationButton = CalculatorButton.from(title: title)
        switch operationButton {
        case .allClear, .equals, .addition, .subtraction, .multiplication, .division:
            configuration.baseBackgroundColor = .orange
        default:
            configuration.baseBackgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        button.configuration = configuration
        
        return button
    }
}
