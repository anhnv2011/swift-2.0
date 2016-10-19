//
//  FileMan.swift
//  FileIO
//
//  Created by Chung on 9/6/16.
//  Copyright © 2016 Techmaster Vietnam. All rights reserved.
//

import Foundation
class FileMan {
    
    let fileManager = NSFileManager.defaultManager()
    //Kiểm tra nếu file tồn tại thì trả về true. File này chỉ nằm trong project bundle
    func isFileExist(file: String)->Bool {
        if NSBundle.mainBundle().URLForResource(file, withExtension: "txt") != nil{
            return true
        }
        else{
            return false
        }
    }
    
    //Kiểm tra nếu đường dẫn tuyệt đối đến file tồn tại
    func isPathExist(path: String)->Bool {
        if fileManager.fileExistsAtPath(path)
        {
            return true
        }else
        {
            return false
        }
    }
    
    //Đọc các dòng trong file vào mảng
    //Nếu file chỉ có tên file thì đọc trong project bundle NSBundle.mainBundle().pathForResource("Test", ofType: "txt")
    //Nếu file đầy đủ path có chứa / thì đọc như bình thường
    func readLines(file: String)->[String] {
        var result: [String] = []
        if (file.containsString("/")) {
            if isPathExist(file) {
                do
                {
                    let data = try NSString(contentsOfFile: file, encoding: NSASCIIStringEncoding)
                    data.enumerateLinesUsingBlock({(line, stop) -> () in
                        result.append(line)
                    })
                    print("count: \(result.count)")
                    print(result)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                return result
            }
        }
        else{
            if isFileExist(file) {
                let path = NSBundle.mainBundle().URLForResource(file, withExtension: "txt")
                do
                {
                    let data = try NSString(contentsOfURL: path!, encoding: NSUTF8StringEncoding)
                    data.enumerateLinesUsingBlock({(line, stop) -> () in
                        result.append(line)
                    })
                    print("count: \(result.count)")
                    print(result)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                return result
            }
        }
        return []
    }
    
    //Đọc tất cả các từ trong file vào mảng các chuỗi
    func readWords(file: String)->[String] {
        var result: [String] = []
        if isPathExist(file) {
            do
            {
                let data = try NSString(contentsOfFile: file, encoding: NSASCIIStringEncoding)
                data.enumerateLinesUsingBlock({(line, stop) -> () in
                    let txt: [String] = line.componentsSeparatedByString(" ")
                    for sub in txt{
                        result.append(sub)
                    }
                })
                print("count \(result.count)")
                print(result)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return result
    }
    
    //Nếu file chưa tồn tại thì tạo file ở đường dẫn path. Chú ý không thể ghi file ở trong bundle của ứng dụng iOS
    //Throw lỗi nếu không ghi thành công
    
    
    func appendStringToFile(path: String, text: String) {
        var txt: String = ""
        if  !isPathExist(path) {
            try! "".writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }
        do{
            txt = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding) as String
            txt.appendContentsOf(text)
            try txt.writeToFile( path , atomically: true, encoding: NSUTF8StringEncoding)
            print("ghi thanh cong")
            
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
    }
    //Nếu file chưa tồn tại thì tạo file ở đường dẫn path. Chú ý không thể ghi file ở trong bundle của ứng dụng iOS
    //Throw lỗi nếu không ghi thành công
    func appendArrayToFile(path: String, array: [String]) {
        var txt: String = ""
        if  !isPathExist(path) {
            try! "".writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)        }
        do{
            txt = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding) as String
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        for text in array {
            txt.appendContentsOf(text)
        }
        do{
            try txt.writeToFile( path , atomically: true, encoding: NSUTF8StringEncoding)
            print("ghi thanh cong")
        }
        catch let error as NSError{ print(error.localizedDescription)
        }
        
        
        
        
        
    }
    
}