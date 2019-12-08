--signatures

sig FiscalCode{}
sig Username{}
sig Password{}
sig User{
    username: one Username,
    password: one Password,
    fiscalCode: one FiscalCode
}

sig TrafficWarden extends User{
}

sig Location{
    latitude: one Int,
    longitude: one Int
}

--{latitude >= -90 and latitude <= 90 and longitude >= -180 and longitude <= 180}
--NB: scaled values for simplicity
{latitude >= -3 and latitude <= 3 and longitude >= -6 and longitude <= 6 }

abstract sig ParkingReportStatus {}
sig Approved , Pending , Rejected extends ParkingReportStatus {}

sig LicensePlate{}

sig ViolationType{}

sig ViolationPicture{}

sig ParkingReport{
    licensePlate: one LicensePlate,
    violationType: one ViolationType,
    violationPicture: one ViolationPicture,
    timestamp: one Int,
    parkingLocation: one Location,
    user: one User,
    takeOnBy: lone TrafficWarden,
    status: one ParkingReportStatus
}
{ timestamp >= 0 }

sig Description{}
sig Reason{}

sig Suggestion{
    suggestionLocation: one Location,
    description: one Description,
    reason: one Reason
}

--facts

--All FiscalCodes have to be associated to a User
fact FiscalCodeUserConnection{
    all fc: FiscalCode | some c: User | fc in c.fiscalCode
}

--All Usernames have to be associated to a User
fact UsernameUserConnection{
    all u: Username | some r: User | u in r.username
}


--All Passwords have to be associated to a User
fact PasswordUserConnection{
    all p: Password | some r: User | p in r.password
}


--Every User has a unique username
fact NoSameUsername {
    no disj u1,u2: User | u1.username = u2.username
}

--There are no ParkingReport on the same vehicle within 1 hour in the same location
fact NoParkingReportWithin1HourInTheSameLocation {
    no disj pr1,pr2 : ParkingReport | pr1.licensePlate = pr2.licensePlate and pr1.parkingLocation = pr2.parkingLocation and 
    (pr1.timestamp < pr2.timestamp and (pr1.timestamp + 3600) > pr2.timestamp)
}

--Every User has a unique FiscalCode
fact NoSameFiscalCode {
    no disj c1,c2 : User | c1.fiscalCode = c2.fiscalCode
}

--All LicensePlate have to be associated to a ParkingReport
fact LicensePlateParkingReportConnection{
    all lp: LicensePlate | some pr: ParkingReport | lp in pr.licensePlate
}

--All ViolationPicture have to be associated to a ParkingReport
fact ViolationPictureParkingReportConnection{
    all vp: ViolationPicture | some pr: ParkingReport | vp in pr.violationPicture
}

--All Description have to be associated to a Suggestion
fact DescriptionSuggestionConnection{
    all d: Description | some s: Suggestion | d in s.description
}

--All Reason have to be associated to a Suggestion
fact ReasonSuggestionConnection{
    all b: Reason | some s: Suggestion | b in s.reason
}

--All Location have to be associated to a Suggestion or a ParkingReport
fact LocationSuggestionParkingReportConnection{
    all l: Location | (some s: Suggestion | l in s.suggestionLocation) or (some pr: ParkingReport | l in pr.parkingLocation)
}


--All ParkingReportStatus have to be associated to a ParkingReport
fact ParkingReportStatusParkingReportConnection{
    all prs: ParkingReportStatus | some pr: ParkingReport | prs in pr.status
}

--Status in ParkingReport have to be Pending if there is no takeOnBy
fact ParkingReportStatusPendingIfNoTakeOn{
    all pr: ParkingReport | pr.takeOnBy = none implies pr.status = Pending
}


--Every ParkingReport has a unique Picture
fact NoSamePicture {
    no disj p1,p2: ParkingReport | p1.violationPicture = p2.violationPicture
}

--Assertions

--It should not be possible to have different ParkingReports on the same vehicle in the same location in the range of a hour
assert noParkingReportOnSameVehicleWithinAnHourInTheSameLocation {
    no disj p1,p2: ParkingReport | p1.licensePlate = p2.licensePlate 
    and ( p1.timestamp - p2.timestamp <= 3600 ) 
    and p1.parkingLocation = p2.parkingLocation
}

--check noParkingReportOnSameVehicleWithinAnHourInTheSameLocation for 3


-- Predicates
pred world1	{
    #ParkingReport	= 1
    #TrafficWarden = 1
    #User = 2
    #Suggestion = 0
}

pred world2	{
    #ParkingReport	=	1
    #TrafficWarden = 0
    #User = 1
    #Suggestion = 0
}

pred world3	{
    #ParkingReport	= 0
    #TrafficWarden = 0
    #User = 0
    #Suggestion = 1
}

run world1 for 3
run world2 for 3
run world3 for 3