import Foundation

// Define the structure
struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

// JSON string
let jsonString = """
{"data":[
{
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
},
{
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
},
{
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
},
{
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
},
]
}
"""

// Convert JSON string to Data
guard let jsonData = jsonString.data(using: .utf8) else {
    fatalError("Unable to convert string to Data")
}

print(jsonData)

// Decode JSON data
do {
    let user = try JSONDecoder().decode(User.self, from: jsonData.subdata(in: <#T##Range<Data.Index>#>))
    print("ID: \(user.id), Name: \(user.name), Email: \(user.email)")
} catch {
    print("Failed to decode JSON: \(error.localizedDescription)")
}

