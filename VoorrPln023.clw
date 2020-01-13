

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module

                     MAP
                       INCLUDE('VOORRPLN023.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
CheckISOCountries    PROCEDURE  (String pISOCountries)     ! Declare Procedure
st      StringTheory

  CODE
        ! in pIsoCountries kunnen meerdere codekomen
        Access:ISOCountries.Open()
        Access:ISOCountries.UseFile()
    st.SetValue(pISOCountries)
    st.Split(',') 
    loop x# = 1 to st.Records()
        Clear(ISO:Record)
        ISO:ISCode=St.GetLine(x#)
        If NOT Access:ISOCountries.Fetch(ISO:PK_ISOCountries)=Level:Benign
            Message('Let op de ISOCode '&St.GetLine(x#)&' kan niet gevonden worden','Error '&ERROR(),ICON:Cross)
        END
    End
        Access:ISOCountries.Close()
