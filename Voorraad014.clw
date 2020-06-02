

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module

                     MAP
                       INCLUDE('VOORRAAD014.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('VOORRAAD013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ConvertInkoopVerkoopStatus PROCEDURE                       ! Declare Procedure
udpt            UltimateDebugProcedureTracker

  CODE
        udpt.Init(UD,'ConvertInkoopVerkoopStatus','Voorraad014.clw','Voorraad.EXE','07/03/2014 @ 11:15AM')    
             
		ConvertInkoopStatus
		ConvertVerkoopStatus
           
  
