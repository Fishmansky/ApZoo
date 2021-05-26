//
//  WorkerDetailsView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct WorkerDetailsViewDev: View {
    @Binding var isPresented: Bool
    var worker: Worker
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Spacer()
                Text("\(worker.name)")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            .background(Color(#colorLiteral(red: 0.6182629615, green: 1, blue: 0.8307533205, alpha: 1)))
            .cornerRadius(8)
            VStack(alignment: .center, spacing: 10) {
                Text("Current task:")
                worker.currentTask()!.getTaskBlock()
            }.padding()
            VStack(alignment: .center, spacing: 10) {
                Text("All tasks:")
                List(worker.Tasks){ task in
                    task.getTaskBlock()
                }
            }.padding()
        }
    }
}

struct WorkerDetailsView: View {
    @Binding var isPresented: Bool
    var worker: Worker
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Text("\(worker.name)")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                Spacer()
            }
            Form{
                Section(header: Text("Current task")){
                    worker.currentTask()?.getTaskBlock()
                }
                Section(header: Text("All tasks")){
                    ForEach(0..<worker.Tasks.count, id: \.self){
                        worker.Tasks[$0].getTaskBlock()
                    }
                }
            }
        }
    }
}

var Tom = Worker("Tom")
var d1 = Task("Duty1", .High)
var d2 = Task("Duty2", .High)
var d3 = Task("Duty3", .High)

struct InteractiveWorkerBlock: View {
    @EnvironmentObject var ObservedTM: TaskManager
    var worker: Worker
    var tasks = 3
    @State var IsClicked: Bool
    var body: some View {
        ZStack{
            ZStack{
                Rectangle()
                    .frame(width: 300, height: IsClicked ? CGFloat((worker.Tasks.count+1)*70) : 70, alignment: .top)
                    .foregroundColor(.silk)
                    .cornerRadius(20)
                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                VStack{
                    ForEach(0..<worker.Tasks.count) {t in
                        Text("\(worker.Tasks[t].description)")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                            .offset(y: IsClicked ? CGFloat((t+1)*(35)) : 0)
                            .animation(.default)
                    }
                }
            }
            
            ZStack{
                Rectangle()
                    .frame(width: 300, height: 70, alignment: .top)
                    .foregroundColor(.salmon)
                    .cornerRadius(20)
                    .offset(y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                HStack{
                    Text(worker.name)
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                    VStack{
                        Text("Current task:")
                            .foregroundColor(.white)
                        Text(worker.currentTaskDescription())
                            .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                    }
                    
                }
                .offset(y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)
                .animation(.default)
                
            }

        }

    }
}

struct WorkerDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        InteractiveWorkerBlock(worker: Tom, IsClicked: false)
    }
}

extension Color {
    
    public static let WhiteBlue: Color = Color(#colorLiteral(red: 0.5725490196, green: 0.862745098, blue: 0.8980392157, alpha: 1))
    public static let DarkBlue: Color = Color(#colorLiteral(red: 0.09803921569, green: 0.4470588235, blue: 0.4705882353, alpha: 1))
    public static let mauve: Color = Color(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1))
    public static let silk: Color = Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.8235294118, alpha: 1))
    public static let salmon: Color = Color(#colorLiteral(red: 0.8862745098, green: 0.5843137255, blue: 0.4705882353, alpha: 1))
    
    public static let whiteBlue: UIColor = UIColor(red: 146, green: 220, blue: 229, alpha: 100)
    
    
    
}
