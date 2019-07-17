This set of dockerfiles is run my the script build_mjd4_all.sh.


You need to download the geant files and mjd files from their respective repositories.
Your overall directory structure should look like this before running the build script:



\# cd MajoranaSW4.2

\# tree -L 2

.

├── build_mjd4_all.log

├── build_mjd4_all.sh

├── build_mjd4_mjsw.sh

├── centos_clhep_root

   └── Dockerfile.centos_clhep_root

├── centos_clhep_root.log

├── centos_geant4.log

├── centos_mjsw.log

├── geant4

   ├── Dockerfile.geant4

   ├── G4ABLA.3.1.tar

   ├── G4EMLOW.7.3.tar

   ├── G4ENSDFSTATE.2.2.tar

   ├── G4NDL.4.5.tar

   ├── G4NEUTRONXS.1.4.tar

   ├── G4PhotonEvaporation.5.2.tar

   ├── G4PII.1.3.tar

   ├── G4RadioactiveDecay.5.2.tar

   ├── G4RealSurface.2.1.1.tar

   ├── G4SAIDDATA1.1.tar

   ├── G4TENDL.1.3.2.tar

   └── geant4.10.04.p03.tar

├── mjsw

   ├── Dockerfile.mjsw

   ├── GAT

   ├── MaGe

   ├── MGDO

   ├── MJD.json

   ├── mjd_siggen

   ├── MJOR

   └── OrcaRoot

├── README.md

├── update_mjdsw.sh
