//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 서정원 on 11/20/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: false)
    }
}
//MARK: - 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

//MARK: - 내비게이션 컨트롤러 델리게이트 메소드
extension ViewController : UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {        //이미지를 선택하지 않고 취소했을 때
        self.dismiss(animated: false, completion: { () in
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소했습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        })
    }
}
//MARK: - 텍스트필드 델리게이트 메소드

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
