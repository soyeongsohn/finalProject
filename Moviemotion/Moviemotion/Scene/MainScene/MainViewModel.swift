//
//  MainViewModel.swift
//  Moviemotion
//
//  Created by Inwoo Park on 2022/05/12.
//

import Foundation

import RxSwift
import RxRelay

final class MainViewModel {
    let diaryListSubject = BehaviorRelay(value: [
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "배가 고파서"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "밥을 먹었는데"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "오노노 기억도 안나고 안할거"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "눈물이 차올라서 고개들어"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "이듬해질녘 꽃피는 봄"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "한 여름 밤의 꿈"),
        Diary(emotionState: Emotion.randomEmotionState(), date: Date(), content: "가을 타 겨울 내린 눈")
    ])
    
    private let disposeBag = DisposeBag()
    
    func addNewDiray(_ new: Diary) {
        var now = self.diaryListSubject.value
        now.insert(new, at: 0)
        self.diaryListSubject.accept(now)
    }
    
    func removeDiary(at idx: Int) {
        var now = self.diaryListSubject.value
        now.remove(at: idx)
        self.diaryListSubject.accept(now)
    }
}
