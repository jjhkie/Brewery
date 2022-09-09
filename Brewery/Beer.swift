
import Foundation

struct Beer: Decodable{
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    ///받아온 정보를 해쉬태그형태로 구성해준다.
    /// tag. hi. bye --> #tag #hi #bye
    
    var tagLIne: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map{
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        
        return hashtags?.joined(separator: " ") ?? "" // #tag #hi # bye
    }
    
    enum CodingKeys: String, CodingKey{
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
}
