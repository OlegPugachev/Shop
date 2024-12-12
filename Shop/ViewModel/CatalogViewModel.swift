
import Foundation

class CatalogViewModel: ObservableObject {
    static let shared = CatalogViewModel()
    
    private init() {}
    
    var popularProducts: [Product] = [
        Product(id: "1", title: "Basics Shagreen Journal", imageUrl: "Not found", price: 8.09, description: "Amazon Basics Shagreen Journal, 2-Pack, Black/Brown"),
        
        Product(id: "2", title: "Sticky Notes", imageUrl: "Not found", price: 6.99, description: "Early Buy Sticky Notes 6 Bright Color 6 Pads Self-Stick Notes 3 in * 3 in, 100 Sheets/Pad"),
        Product(id: "3", title: "Rollerball Pen", imageUrl: "Not found", price: 5.59, description: "6Pcs Rollerball Pen, Including 3Pcs Pen Refills Blue and Pen Refills Black, Roller Ball Pen, Ballpoint Pen Refills, Smooth Writing, Pen Refills Black Ballpoint for School and Office Supplies (0.7mm)"),
        Product(id: "4", title: "Sketching Pencils Set", imageUrl: "Not found", price: 3.97, description: "Sketching Pencils Set of 8 - B, 2B, 4B, 6B, 8B, HB, 2H, 4H - Drawing Pencils with Graphite Lead & Premium Wood are Ideal for Sketching, Shading & Doodling - For Beginners & Professionals")
    ]
    
    var products: [Product] = [
        Product(id: "1", title: "Basics Shagreen Journal", imageUrl: "Not found", price: 8.09, description: "Amazon Basics Shagreen Journal, 2-Pack, Black/Brown"),
        
        Product(id: "2", title: "Sticky Notes", imageUrl: "Not found", price: 6.99, description: "Early Buy Sticky Notes 6 Bright Color 6 Pads Self-Stick Notes 3 in * 3 in, 100 Sheets/Pad"),
        Product(id: "3", title: "Rollerball Pen", imageUrl: "Not found", price: 5.59, description: "6Pcs Rollerball Pen, Including 3Pcs Pen Refills Blue and Pen Refills Black, Roller Ball Pen, Ballpoint Pen Refills, Smooth Writing, Pen Refills Black Ballpoint for School and Office Supplies (0.7mm)"),
        Product(id: "4", title: "Sketching Pencils Set", imageUrl: "Not found", price: 3.97, description: "Sketching Pencils Set of 8 - B, 2B, 4B, 6B, 8B, HB, 2H, 4H - Drawing Pencils with Graphite Lead & Premium Wood are Ideal for Sketching, Shading & Doodling - For Beginners & Professionals"),
        
        
        Product(id: "5", title: "Basics Shagreen Journal", imageUrl: "Not found", price: 8.09, description: "Amazon Basics Shagreen Journal, 2-Pack, Black/Brown"),
        
        Product(id: "6", title: "Sticky Notes", imageUrl: "Not found", price: 6.99, description: "Early Buy Sticky Notes 6 Bright Color 6 Pads Self-Stick Notes 3 in * 3 in, 100 Sheets/Pad"),
        Product(id: "7", title: "Rollerball Pen", imageUrl: "Not found", price: 5.59, description: "6Pcs Rollerball Pen, Including 3Pcs Pen Refills Blue and Pen Refills Black, Roller Ball Pen, Ballpoint Pen Refills, Smooth Writing, Pen Refills Black Ballpoint for School and Office Supplies (0.7mm)"),
        Product(id: "8", title: "Sketching Pencils Set", imageUrl: "Not found", price: 3.97, description: "Sketching Pencils Set of 8 - B, 2B, 4B, 6B, 8B, HB, 2H, 4H - Drawing Pencils with Graphite Lead & Premium Wood are Ideal for Sketching, Shading & Doodling - For Beginners & Professionals")
        
    ]
}
