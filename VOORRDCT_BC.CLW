  MEMBER('VoorrDct.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('VoorrDct_BC0.CLW')
VoorrDct_BC0:DctInit             PROCEDURE()
VoorrDct_BC0:DctKill             PROCEDURE()
VoorrDct_BC0:FilesInit           PROCEDURE()
    END
    MODULE('VoorrDct_BC1.CLW')
VoorrDct_BC1:DctInit             PROCEDURE()
VoorrDct_BC1:DctKill             PROCEDURE()
VoorrDct_BC1:FilesInit           PROCEDURE()
    END
    MODULE('VoorrDct_BC2.CLW')
VoorrDct_BC2:DctInit             PROCEDURE()
VoorrDct_BC2:DctKill             PROCEDURE()
VoorrDct_BC2:FilesInit           PROCEDURE()
    END
    MODULE('VoorrDct_BC3.CLW')
VoorrDct_BC3:DctInit             PROCEDURE()
VoorrDct_BC3:DctKill             PROCEDURE()
VoorrDct_BC3:FilesInit           PROCEDURE()
    END
    MODULE('VoorrDct_BC4.CLW')
VoorrDct_BC4:DctInit             PROCEDURE()
VoorrDct_BC4:DctKill             PROCEDURE()
VoorrDct_BC4:FilesInit           PROCEDURE()
    END
    MODULE('VoorrDct_BC5.CLW')
VoorrDct_BC5:DctInit             PROCEDURE()
VoorrDct_BC5:DctKill             PROCEDURE()
VoorrDct_BC5:FilesInit           PROCEDURE()
    END
  END

DLLInit              DllInitializer                          !This object is used to initialize the dll, it is defined in the main program module

DctInit PROCEDURE()
  CODE
  VoorrDct_BC0:DctInit
  VoorrDct_BC1:DctInit
  VoorrDct_BC2:DctInit
  VoorrDct_BC3:DctInit
  VoorrDct_BC4:DctInit
  VoorrDct_BC5:DctInit
  VoorrDct_BC0:FilesInit
  VoorrDct_BC1:FilesInit
  VoorrDct_BC2:FilesInit
  VoorrDct_BC3:FilesInit
  VoorrDct_BC4:FilesInit
  VoorrDct_BC5:FilesInit


DctKill PROCEDURE()
  CODE
  VoorrDct_BC0:DctKill
  VoorrDct_BC1:DctKill
  VoorrDct_BC2:DctKill
  VoorrDct_BC3:DctKill
  VoorrDct_BC4:DctKill
  VoorrDct_BC5:DctKill

