' *****************************************************************************************************
'   This is the code to load into Future Pinball tables to link to DOFLinx
'   It's by DDH69 and is the version to work with DOFLinx version 6.31
'   For full instructions download the DOFLinx zip and read the guide.
'  
'  
'   Basic setup reminder for authors .....    (read the DOFLinx guide for full details)
'     1) Add this line directly below your main "Dim" statements - LoadExternalScript("DOFLinx.vbs")
'     2) Then add FF_Init as the first item in the ..... section
'     3) Add FF_DOFFX2=1 below the FF_Init to allow people to enable / disable manually.
'        This flag can be left set as 1, if no link is detected normal sounds will be played anyway - its a manual override.
'     4) Replace the appropraite "PlaySound X,V " statements with "FF_Sound DD,TTTTX,X,V
'         DD (device) = DV_LF, DV_RF (L & R Flipper), DV_LS, DV_RS (L & R Slingshot), DV_ML, DV_MC, DV_MR (Mid Left, Centre, Right)
'                       DV_BL, DV_BC, DV_BR (Back Left, Centre, Right), DV_SH (Shaker), DV_GR (Gear), DV_KN (Knocker)
'         TTTT = time on in one hundreths of a second, so 100 is one second, 25 is a quarter of a second
'                -1 is the default time set in the DOFFX2 config for that device (usually the way for solenoids)
'                0 turns off the output
' *****************************************************************************************************

Dim FF_DOFLinx
Dim DDH_Slots(127,1)
Dim DOFWaitCount
Dim DOFCycle
Dim PUPCycle
Const DV_LF=1              ' Left Flipper
Const DV_RF=2              ' Right Flipper
Const DV_LS=3              ' Left Slingshot
Const DV_RS=4              ' Right Slingshot
Const DV_ML=5              ' Mid Left
Const DV_MC=6              ' Mid Centre
Const DV_MR=7              ' Mid Right
Const DV_BL=8              ' Back Left
Const DV_BC=9              ' Back Centre
Const DV_BR=10             ' Back Right
Const DV_SH=11             ' Shaker motor
Const DV_GR=12             ' Gear motor
Const DV_KN=13             ' Knocker
Const DV_RGB=14            ' For Testing RGB exisitence
Const DV_FN=20             ' Fan
Const DV_SR=21             ' Strobe
Const DV_BK=22             ' Beacon
Const DV_FLOL=23           ' Flasher Outside Left
Const DV_FLIL=24           ' Flasher Inside Left
Const DV_FLCN=25           ' Flasher Centre
Const DV_FLOR=26           ' Flasher Outside Right
Const DV_FLIR=27           ' Flasher Inside Right
Const RGB_DF=1             ' RGB default running
Const RGB_TT=2	       	   ' RGB timed output
Const RGB_CH=3             ' RGB Set a new colour
Const RGB_FL=4             ' Flash for the supplied time
Const BUT_ST=15            ' Start button
Const BUT_EB=16            ' Extra Ball button
Const BUT_EX=17            ' Exit button
Const BUT_CN=18            ' Coin button
Const BUT_LB=19            ' Launch ball button
Const BUT_FR=28            ' Fire button
Const BA_ON=1              ' Action to turn button LED on
Const BA_OFF=2             ' Action to turn button LED off
Const BA_TT=3              ' Action to turn on button LED for a set time
Const BA_FL=4              ' Action to flash a button LED for a number of iterations with delay between iteration
Const BA_FD=5              ' Action to fade button LED up and down for a number of iterations over time period supplied per fade
Const FL_ON=1              ' Turn Flasher on
Const FL_OFF=2             ' Turn Flasher off
Const FL_TT=3              ' Turn Flasher on for a set time
Const FL_FL=4              ' Flash the Flasher for number of iterations with the supplied delat between iterations
Const FL_FD=5              ' Fade the Flasher up and down for the number of iterations over the supplied time period between fades
Const PUP_INIT=1           ' Intialise the PUPlayer
Const PUP_EVENT=2          ' Send an event message to PUPlayer

Sub FF_Init()
  Dim c
  for c=0 to 31
    DDH_Slots(c,0)=31249999999997*32+c
    DDH_Slots(c,1)=1
    DDH_Slots((c+32),0)=31249999999998*32+c
    DDH_Slots((c+32),1)=1
    DDH_Slots((c+64),0)=31249999999996*32+c
    DDH_Slots((c+64),1)=1
    DDH_Slots((c+96),0)=31249999999995*32+c
    DDH_Slots((c+96),1)=1
  Next
  DOFWaitCount=0
  DOFCycle=0
  PUPCycle=0
End Sub

Function FF_Active()
  if (FF_DOFLinx=1) and (DDH_Slots(0,0)<999999999999900) then
    FF_Active = true
  else
    FF_Active=false
  end if
End Function

Function FF_IsDevice(ByVal TestFor)
  if (DDH_Slots(0,0) and (2^(TestFor-1))) = 2^(TestFor-1) then
    FF_IsDevice = true
  else
    FF_IsDevice = false
  end if
End Function

Sub FF_DevEnc(D,T)
  Dim Q
  DDH_Slots(D,1)=DDH_Slots(D,1)+1
  if DDH_Slots(D,1)>9 then
    DDH_Slots(D,1)=1
  end if
  if T>999999 then
    T = 999999
  end if
  if T<0 then
    T=0
    Q=10
  else
    Q=0
  end if
  DDH_Slots(D,0)=CDbl((T*100)+Q+DDH_Slots(D,1))
End Sub

Sub FF_Dev(FF_Device,OnTime)
  if FF_Active = True then
    if FF_IsDevice(FF_Device) = true then
      FF_DevEnc FF_Device,OnTime
    end if
  end if
End Sub

Sub FF_Sound(FF_Device,OnTime,OrigSound)
  FF_SoundVol FF_Device, OnTime,OrigSound,1
End Sub

Sub FF_SoundVol(FF_Device,OnTime,OrigSound,OrigVolume)
  if FF_Active = True then
    if FF_IsDevice(FF_Device) = true then
      FF_DevEnc FF_Device,OnTime
    else
      PlaySound OrigSound, OrigVolume
    end if
  else
    PlaySound OrigSound, OrigVolume 
  end if
End Sub

Sub FF_EncColour(TheColour,TheBase)
  Dim C(20)
  Dim P
  TheColour=ucase(left(TheColour+"                     ",21))
  C(0)=asc(CStr(mid(TheColour,1,1)))
  C(1)=asc(CStr(mid(TheColour,2,1)))
  C(2)=asc(CStr(mid(TheColour,3,1)))
  C(3)=asc(CStr(mid(TheColour,4,1)))
  C(4)=asc(CStr(mid(TheColour,5,1)))
  C(5)=asc(CStr(mid(TheColour,6,1)))
  C(6)=asc(CStr(mid(TheColour,7,1)))
  C(7)=asc(CStr(mid(TheColour,8,1)))
  C(8)=asc(CStr(mid(TheColour,9,1)))
  C(9)=asc(CStr(mid(TheColour,10,1)))
  C(10)=asc(CStr(mid(TheColour,11,1)))
  C(11)=asc(CStr(mid(TheColour,12,1)))
  C(12)=asc(CStr(mid(TheColour,13,1)))
  C(13)=asc(CStr(mid(TheColour,14,1)))
  C(14)=asc(CStr(mid(TheColour,15,1)))
  C(15)=asc(CStr(mid(TheColour,16,1)))
  C(16)=asc(CStr(mid(TheColour,17,1)))
  C(17)=asc(CStr(mid(TheColour,18,1)))
  C(18)=asc(CStr(mid(TheColour,19,1)))
  C(19)=asc(CStr(mid(TheColour,20,1)))
  C(20)=asc(CStr(mid(TheColour,21,1)))
  for P=TheBase to TheBase+2
    DDH_Slots(P,0)=0
  next
  for P=6 to 0 step -1
    DDH_Slots(TheBase,0)=CDbl(DDH_Slots(TheBase,0)+(C(P)*100^P))
    DDH_Slots(TheBase+1,0)=CDbl(DDH_Slots(TheBase+1,0)+(C(P+7)*100^P))
    DDH_Slots(TheBase+2,0)=CDbl(DDH_Slots(TheBase+2,0)+(C(P+14)*100^P))
  next
End Sub

Sub FF_Colour(TheColour,TheAction,OnTime)
  if FF_Active = true then
    FF_EncColour TheColour,61 
    DDH_Slots(14,1)=DDH_Slots(14,1)+1
    if DDH_Slots(14,1)>9 then
      DDH_Slots(14,1)=1
    end if
    if OnTime>999999 then
      OnTime=999999
    end if
    if OnTime<0 then
      OnTime=0
    end if
    DDH_Slots(14,0)=CDbl((OnTime*1000)+(TheAction*10)+DDH_Slots(14,1))
  end if
End Sub

Sub FF_Button(D,TheAct,TheIt,TheTime)
  Dim Q
  if FF_Active = true then
    if FF_IsDevice(D) = true then
      DDH_Slots(D,1)=DDH_Slots(D,1)+1
      if DDH_Slots(D,1)>9 then
        DDH_Slots(D,1)=1
      end if
      if TheIt>9999 then
        TheIt=9999
      end if
      if TheTime>99999 then
        TheTime = 99999
      end if
      DDH_Slots(D,0)=CDbl((TheIt*10000000)+(TheTime*100)+(TheAct*10)+DDH_Slots(D,1))
    end if
  end if
End Sub

Sub FF_Flasher(D,TheAct,TheIt,TheTime,ThePercInt,TheColour)
  Dim Q
  Dim CS
  if FF_Active = true then
    if FF_IsDevice(D) = true then
      DDH_Slots(D,1)=DDH_Slots(D,1)+1
      if DDH_Slots(D,1)>9 then
        DDH_Slots(D,1)=1
      end if
      if TheIt>9999 then
        TheIt=9999
      end if
      if TheTime>99999 then
        TheTime = 99999
      end if
      if ThePercInt>100 then
        ThePercInt=100
      end if
      if ThePercInt<0 then
        ThePercInt=0
      end if
      select case D
        case DV_FLOL
          CS=46
        case DV_FLIL
          CS=49
        case DV_FLCN
          CS=52
        case DV_FLOR
          CS=55
        case DV_FLIR
          CS=58
        case else
          CS=52
      end select
      FF_EncColour TheColour,CS
      DDH_Slots(D,0)=CDbl((ThePercInt*1000000000000)+(TheIt*10000000)+(TheTime*100)+(TheAct*10)+DDH_Slots(D,1))
    end if
  end if
End Sub

Sub FF_FlasherForMs(RunTime,FlashTime,EndWith,D,ThePerc,TheColour)
  Dim NumbIt
  NumbIt=round(RunTime/FlashTime)                           ' Calculate an integer for the number of iterations
  if ((NumbIt/2)-int(NumbIt/2))>0 then                      ' Check if there is an even number of iterations
   if (EndWith=bulboff) then                                 ' If its an even number of iterations and you want to leave the bulbon, then add one to make it uneven
      NumbIt=NumbIt+1
    end if
  else
   if (EndWith=bulbon) then                                ' If its an uneven number of iterations and you want to leave the bulb off, then add one to make it uneven
      NumbIt=NumbIt+1
    end if
   end if
  FlashTime=round(FlashTime/10)                             ' Convert the flash time total to 1/100th's
  FF_Flasher D,FL_FL,NumbIt,FlashTime,ThePerc,TheColour     ' Now use the existing DOFLinx function
End Sub

Sub FF_ROM(TheROM)
  if FF_Active = true then
    FF_EncColour TheROM,43
    DDH_Slots(29,1)=DDH_Slots(29,1)+1
    if DDH_Slots(29,1)>9 then
      DDH_Slots(29,1)=1
    end if
    DDH_Slots(29,0)=12345678910+DDH_Slots(29,1)
  end if
End Sub

Sub FF_DOF(TheEvent,TheRef,TheTime)
  Dim OnOff
  Dim TheType
  DOFCycle=DOFCycle+1
  if DOFCycle>2 then
    DOFCycle=0
  end if
  DDH_Slots(30+DOFCycle,1)=DDH_Slots(30+DOFCycle,1)+1
  if DDH_Slots(30+DOFCycle,1)>9 then
    DDH_Slots(30+DOFCycle,1)=1
  end if
  if TheTime = 0 then
    OnOff=0
  else
    OnOff=1
    TheTime = TheTime + 1
    if TheTime < 0 then
      TheTime=0
    end if
  end if
  select case TheEvent
    case "E"
      TheType=1
    case "W"
      TheType=2
    case "S"
      TheType=3
    case "L"
      TheType=4
    case "G"
      TheType=5
    case "M"
      TheType=6
    case "N"
      TheType=7
    case "D"
      TheType=8
    case "D"
      TheType=9
    case else
      TheType=0
  end select
  DDH_Slots(30+DOFCycle,0)=(OnOff*1000000000000)+(TheType*100000000000)+(TheRef*10000000)+(TheTime*10)+DDH_Slots(30+DOFCycle,1)
End Sub

Sub FF_PUPlayer(TheEvent,TheStr,TheArg)
  PUPCycle=PUPCycle+1
  if PUPCycle>2 then
    PUPCycle=0
  end if
  DDH_Slots(33+PUPCycle,1)=DDH_Slots(33+PUPCycle,1)+1
  if DDH_Slots(33+PUPCycle,1)>9 then
    DDH_Slots(33+PUPCycle,1)=1
  end if
  FF_EncColour TheStr,119+(PUPCycle*3)
  DDH_Slots(33+PUPCycle,0)=1000000000000+(TheArg*100)+(TheEvent*10)+DDH_Slots(33+PUPCycle,1)
End Sub