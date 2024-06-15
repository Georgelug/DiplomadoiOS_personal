import Foundation


let queue = DispatchQueue(label: "serial.queue",attributes: .concurrent)

print("starting serial program execution")
queue.async {
    print("Starting first task")
    
    for _ in 0...2 {
        sleep(2)
    }
    
    print("Finished first task")
}

print("middle point")

queue.async {
    print("Starting second task")
    
    for _ in 0...2 {
        sleep(2)
    }
    
    print("Finished second task")
}
