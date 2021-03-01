
protocol AdvancedLifeSupport { //required ceritficate
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? //has to know CPR
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport { //use Advance... as a data type
    
    init(handler: EmergencyCallHandler) {
        //it's like a call
        handler.delegate = self //pick up pager and get ready to do a command
    }
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) { //if he/she is on their shift then they can pick up call
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compression. 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
    
}

class Surgeon: Doctor { //automatically inherits AdvanceLifeSupport protocol
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    func useElectricDrill() {
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio) //emilio is going to tell him what to do with a call

let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
