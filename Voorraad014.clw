

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

  CODE
		ConvertInkoopStatus
		ConvertVerkoopStatus
