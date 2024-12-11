

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module

                     MAP
                       INCLUDE('VOORRPLN022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
CheckISOCountries    PROCEDURE  (String pISOCountries)     ! Declare Procedure
udpt            UltimateDebugProcedureTracker
Loc:ReturnValue      BYTE                                  ! 
st      StringTheory

  CODE
? DEBUGHOOK(ISOCountries:Record)
        udpt.Init(UD,'CheckISOCountries','VoorrPln022.clw','VoorrPln.DLL','07/10/2024 @ 02:08PM')    
             
             ! in pIsoCountries kunnen meerdere codekomen
    Loc:ReturnValue = Level:Benign
    Access:ISOCountries.Open()
    Access:ISOCountries.UseFile()
    st.SetValue(pISOCountries)
    st.Split(',') 
    loop x# = 1 to st.Records()
        Clear(ISO:Record)
        ISO:ISCode=St.GetLine(x#)
        If NOT Access:ISOCountries.Fetch(ISO:PK_ISOCountries)=Level:Benign
            Message('Let op de ISOCode '&St.GetLine(x#)&' kan niet gevonden worden','Error '&ERROR(),ICON:Cross)
            Loc:ReturnValue = Level:Cancel
        END
    End
    Access:ISOCountries.Close()
    RETURN Loc:ReturnValue
           
  
