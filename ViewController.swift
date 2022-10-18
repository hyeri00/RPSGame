//
//  ViewController.swift
//  RPSGame
//
//  Created by 혜리 on 2022/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 데이터 저장을 위한 변수 (컴퓨터 선택/나의 선택)
    var myChoice: Rps = Rps.rock // 나의 선택에 대한 변수
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))! // 컴퓨터의 선택에 대한 변수(랜덤)
    
    
    // 함수 / 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 첫 번째/두 번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫 번째/두 번째 레이블에 "준비"라고 문자열을 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    // 가위/바위/보 버튼
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보(enum)를 선택해서 그 정보를 저장 해야됨
        
        // 버튼의 문자를 가져옴
//        guard let title = sender.currentTitle else { return }
        let title = sender.currentTitle! // currentTitle은 버튼의 제목을 가져오는 API
        print(title)
        
        switch title {
        case "바위":
            myChoice = Rps.rock
        case "가위":
            myChoice = Rps.scissors
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    // SELECT 버튼
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤으로 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        }
        
        // 3) 내가 선택한 것을 이미지뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        }
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단/표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
    
    // RESET 버튼
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 내 선택 이미지뷰에도 준비 이미지뷰에 표시
        // 4) 내 선택 레이블에도 준비 문자열 레이블에 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인 레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!

        
    }
}


