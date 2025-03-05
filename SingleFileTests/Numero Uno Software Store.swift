// Ivan Larinin
// Numero Uno Software Store
// Codeacademy Swift Course March 5 2025

// Enumeration that holds different types of software products
enum ProductType: String, CaseIterable {
  case aceRepository = "Ace Repository"
  case dealForcer = "Deal Forcer"
  case kadencePlanner = "Kadence Planner"
  case mailCannon = "Mail Cannon"
}

// Function to display all available software products
func displayProductOfferings() {
  print("There are \(ProductType.allCases.count) products:")
  
  for type in ProductType.allCases {
    print(type.rawValue)
  }
}

// Enumeration representing different editions of a product
enum Edition: String {
  case basic, premium, ultimate
  
  // Method to upgrade edition
  mutating func upgrade() {
      switch self {
      case .basic:
          self = .premium
      case .premium:
          self = .ultimate
      case .ultimate:
          print("Can’t upgrade further")
      }
  }
}

// Enumeration for delivery methods
enum DeliveryMethod {
    case cloudDigital(isLifetime: Bool) // Digital cloud-based delivery
    case shipping(weight: Int) // Physical shipping with weight

    // Computed property to calculate shipping cost
    var shippingCost: Int {
        switch self {
        case .cloudDigital:
            return 0 // No shipping cost for digital products
        case .shipping(let weight):
            return weight * 2 // Cost formula: $2 per kg
        }
    }
}

// Function to send an order confirmation
func sendOrderConfirmation(of productType: ProductType, in edition: Edition, by deliveryMethod: DeliveryMethod) {
    let deliveryDescription: String
    switch deliveryMethod {
    case .cloudDigital(let isLifetime):
        deliveryDescription = isLifetime ? "You have lifetime cloud access" : "You can access your subscription information on the cloud"
    case .shipping(let weight):
        deliveryDescription = "Shipping weight: \(weight)kg. Cost: $\(deliveryMethod.shippingCost)."
    }
    
    print("\nOrder Confirmation:\nProduct: \(productType.rawValue)\nEdition: \(edition.rawValue)\nDelivery: \(deliveryDescription)")
}

// Simple Test Cases
func runTests() {
    print("\nRunning Tests...")
    
    // Test Edition Upgrade
    var testEdition = Edition.basic
    testEdition.upgrade()
    print("Upgrade Test 1: \(testEdition == .premium ? "Passed" : "Failed")")
    testEdition.upgrade()
    print("Upgrade Test 2: \(testEdition == .ultimate ? "Passed" : "Failed")")
    testEdition.upgrade() // Should print "Can’t upgrade further"
    
    // Test Shipping Cost Calculation
    let shippingTest1 = DeliveryMethod.shipping(weight: 3)
    print("Shipping Cost Test 1: \(shippingTest1.shippingCost == 6 ? "Passed" : "Failed")")
    
    let shippingTest2 = DeliveryMethod.shipping(weight: 10)
    print("Shipping Cost Test 2: \(shippingTest2.shippingCost == 20 ? "Passed" : "Failed")")
    
    // Test Cloud Delivery
    let cloudTest1 = DeliveryMethod.cloudDigital(isLifetime: true)
    let cloudTest2 = DeliveryMethod.cloudDigital(isLifetime: false)
    print("Cloud Digital Test 1: \(cloudTest1.shippingCost == 0 ? "Passed" : "Failed")")
    print("Cloud Digital Test 2: \(cloudTest2.shippingCost == 0 ? "Passed" : "Failed")")
}

// Display available products
displayProductOfferings()

// Example usage
var myEdition: Edition = .basic
sendOrderConfirmation(of: .aceRepository, in: .premium, by: .shipping(weight: 3))

// Run tests
runTests()


// The output
/*
There are 4 products:
Ace Repository
Deal Forcer
Kadence Planner
Mail Cannon

Order Confirmation:
Product: Ace Repository
Edition: premium
Delivery: Shipping weight: 3kg. Cost: $6.

Running Tests...
Upgrade Test 1: Passed
Upgrade Test 2: Passed
Can’t upgrade further
Shipping Cost Test 1: Passed
Shipping Cost Test 2: Passed
Cloud Digital Test 1: Passed
Cloud Digital Test 2: Passed
*/
