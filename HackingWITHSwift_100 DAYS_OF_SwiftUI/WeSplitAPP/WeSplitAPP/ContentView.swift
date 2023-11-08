//
//  ContentView.swift
//  WeSplitAPP
//
//  Created by 정정욱 on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    
    // 네비게이션 바 추가해서 사용하기 : 만들지 않고 스크롤시 safeArea 침범해서 Text가 시간이랑 겹쳐보이는 등 문제 발생
    /*
     우리는 프로그램이 실행되는 동안 값을 변경할 수 있기를 원하지만 Swift에서는 뷰가 구조체이기 때문에 이를 허용하지 않습니다.
     
     다행스럽게도 Swift는 속성 래퍼(property Wrapper) 라는 특별한 솔루션을 제공합니다 . 속성 앞에 배치하여 효과적으로 초능력을 부여할 수 있는 특별한 속성입니다. 버튼을 탭한 횟수와 같은 간단한 프로그램 상태를 저장하는 경우 @State다음과 같이 SwiftUI의 속성 래퍼를 사용할 수 있습니다.
     
     왜 클래스를 대신 사용하지 않는지 궁금할 것입니다. 클래스는 자유롭게 수정할 수 있습니다 . 하지만 저를 믿으세요. 가치가 있습니다. 진행하면서 SwiftUI가 구조체를 자주 파괴하고 다시 생성하므로 구조체를 작고 단순하게 유지하는 것이 성능에 중요하다는 것을 알게 될 것입니다.

    팁: SwiftUI에 프로그램 상태를 저장하는 여러 가지 방법이 있으며, 모든 방법을 배우게 됩니다. @State하나의 보기에 저장되는 간단한 속성을 위해 특별히 설계되었습니다. 결과적으로 Apple에서는 private다음과 같이 해당 속성에 액세스 제어를 추가할 것을 권장합니다 @State private var tapCount = 0.
     */
    
    @State var tapCount = 0
    
    @State private var name = "" // 양방향 바인딩 입니다. 속성 값을 표시하도록 텍스트 필드를 바인딩할 뿐만 아니라 텍스트 필드에 대한 변경 사항도 속성을 업데이트하도록 바인딩하기도 합니다.
    
    
    /*
     배열 은 상수이기 때문에 students표시할 필요가 없습니다 . @State 필요 x 변경 되지 않을 것임
     
     속성 selectedStudent은 "Harry" 값으로 시작하지만 변경될 수 있으므로 로 표시됩니다 @State.

     */
    let students = ["Harry", "Hermione", "Ron"]
       @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            
            
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
            }
            
            Form {
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                
                ForEach(0..<100) { number in
                    Text("Row \(number)")
                }
            }
            
            Section {
                Form {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
     
    }
    /*
     ForEach(students, id: \.self). 이는 배열을 반복하므로 students각 항목에 대한 텍스트 보기를 만들 수 있지만 그 id: \.self부분이 중요합니다. 이는 SwiftUI가 화면의 모든 보기를 고유하게 식별할 수 있어야 하고 상황이 변경되는 시기를 감지할 수 있어야 하기 때문에 존재합니다.

    예를 들어 Ron이 먼저 오도록 배열을 재배치하면 SwiftUI는 동시에 텍스트 보기를 이동합니다. 따라서, 문자열 배열의 각 항목을 고유하게 식별할 수 있는 방법을 SwiftUI에 알려주어야 합니다. 각 문자열이 고유하게 만드는 것은 무엇입니까?

    구조체 배열이 있는 경우 "아, 내 구조체에는 title항상 고유한 문자열이 있습니다." 또는 "내 구조체에는 id항상 고유한 정수가 있습니다." 라고 말할 수 있습니다. 그러나 여기에는 단순한 문자열 배열이 있고 문자열에서 유일하게 고유한 점은 문자열 자체입니다. 배열의 각 문자열은 다르므로 문자열은 자연스럽게 고유합니다.
     */
}

#Preview {
    ContentView()
}



